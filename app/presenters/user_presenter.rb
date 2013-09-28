class UserPresenter
  attr_accessor :user

  def initialize(user)
    self.user = user
  end

  def to_json(options = {})
    self.user.to_json(options)
  end
end
