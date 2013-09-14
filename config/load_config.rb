require 'configurate'

rails_root = File.expand_path('../../', __FILE__)
rails_env = ENV['RACK_ENV']
rails_env ||= ENV['RAILS_ENV']
rails_env ||= 'development'

require File.join(rails_root, 'lib', 'configuration_methods')

config_dir = File.join rails_root, 'config'


AppConfig ||= Configurate::Settings.create do
  add_provider Configurate::Provider::Dynamic
  add_provider Configurate::Provider::Env
  
  unless heroku? || rails_env == "test" || File.exists?(File.join(config_dir, 'rails4bp.yml'))
    $stderr.puts "FATAL: Configuration not found. Copy over rails4bp.yml.example"
    $stderr.puts "       to rails4bp.yml and edit it to your needs."
    exit!
  end
  
  add_provider Configurate::Provider::YAML,
               File.join(config_dir, 'rails4bp.yml'),
               namespace: rails_env, required: false unless rails_env == 'test'
  add_provider Configurate::Provider::YAML,
               File.join(config_dir, 'rails4bp.yml'),
               namespace: "configuration", required: false
  add_provider Configurate::Provider::YAML,
               File.join(config_dir, 'defaults.yml'),
               namespace: rails_env
  add_provider Configurate::Provider::YAML,
               File.join(config_dir, 'defaults.yml'),
               namespace: "defaults"

  extend Configuration::Methods
  
  if rails_env == "production"  &&
    (environment.certificate_authorities.nil? ||
     environment.certificate_authorities.empty? ||
     !File.file?(environment.certificate_authorities.get))
    $stderr.puts "FATAL: Rails4Bp doesn't know where your certificate authorities are. Please ensure they are set to a valid path in rails4bp.yml"
    exit!
  end
end
