class User < ActiveRecord::Base
  #rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :confirmable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me

  # RELATIONS
  has_many :pages
  has_one :profile

  def self.username_length
    3..15
  end

  def self.username_available?(username)
    lower = username.downcase
    User.where(username_lower: lower).blank?
  end

  EMAIL = %r{([^@]+)@([^\.]+)}

  def self.new_from_params(params)
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.username = params[:username]
    user
  end

  def self.suggest_name(email)
    return "" unless email
    name = email.split(/[@\+]/)[0]
    name = name.gsub(".", " ")
    name.titleize
  end

  # Find a user by temporary key, nil if not found or key is invalid
  def self.find_by_temporary_key(key)
    user_id = $redis.get("temporary_key:#{key}")
    if user_id.present?
      where(id: user_id.to_i).first
    end
  end

  def self.find_by_username_or_email(username_or_email)
    conditions = if username_or_email.include?('@')
                   {email: Email.downcase(username_or_email)}
                 else
                   {username_lower: username_or_email.downcase}
                 end

    users = User.where(conditions).to_a

    if users.size > 1
      raise Rails4Bp::TooManyMatches
    else
      users.first
    end
  end

  def change_username(new_username)
    current_username = self.username
    self.username = new_username

    if current_username.downcase != new_username.downcase && valid?
      Rails4BpHub.nickname_operation { Rails4BpHub.change_nickname(current_username, new_username) }
    end
    save
  end

  # Use a temporary key to find this user, store it in redis with an expiry
  def temporary_key
    key = SecureRandom.hex(32)
    $redis.setex "temporary_key:#{key}", 1.week, id.to_s
    key
  end

end
