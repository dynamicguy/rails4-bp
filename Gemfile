source 'http://rubygems.org'

gem 'rails', :git => 'git://github.com/rails/rails.git', :branch => '4-0-stable'
gem 'redis-rails', :git => 'git://github.com/SamSaffron/redis-store.git'
gem 'rails-observers'
gem 'actionpack-action_caching'

#gem 'arel', github: 'rails/arel'
#gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'

gem 'seed-fu', github: 'mbleigh/seed-fu'

gem 'hiredis'
gem 'redis', :require => ["redis", "redis/connection/hiredis"]

ENV['DB'] ||= 'mysql'

gem 'mysql2', '0.3.13' if ENV['DB'] == 'all' || ENV['DB'] == 'mysql'
gem 'pg', '0.16.0' if ENV['DB'] == 'all' || ENV['DB'] == 'postgres'

gem 'state_machine', '~> 1.2.0'

# File uploading
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'
gem 'remotipart'

# Localization
gem 'http_accept_language'
gem "i18n-inflector-rails", :git => 'git://github.com/dynamicguy/i18n-inflector-rails.git'
gem 'rails-i18n', '~> 4.0.0.pre'

# Mail
gem 'markerb', '1.0.1'
gem 'messagebus_ruby_api', '1.0.3'

# Parsing
gem 'multi_json'
gem 'nokogiri', '1.6.0'
gem 'rails_autolink', '1.1.0'
gem 'redcarpet', '3.0.0'
gem 'roxml', '3.1.6'
gem 'ruby-oembed', '0.8.8'
gem 'opengraph_parser', '0.2.3'

gem "yui-compressor", "~> 0.12.0"
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "eco"
  # Icons
  gem "font-awesome-rails"
  #gem 'entypo-rails'

  # CSS
  # Use SCSS for stylesheets
  gem 'less-rails'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'

  #gem 'bootstrap-sass'
  gem "compass-rails", "~> 2.0.alpha.0"

  # JavaScript
  #gem 'handlebars_assets', '>= 0.12.0'
  gem 'jquery-rails', '~> 3.0'

  # Windows and OSX have an execjs compatible runtime built-in, Linux users should
  # install Node.js or use 'therubyracer'.
  #
  # See git://github.com/sstephenson/execjs#readme for more supported runtimes

  gem 'therubyracer', :platform => :ruby

end

# Build JSON APIs with ease. Read more: git://github.com/rails/jbuilder
#gem 'jbuilder', '~> 1.2'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Background processing
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sinatra'
gem 'slim'

# Use unicorn as the app server
#gem 'unicorn', '4.6.3', :require => false
#gem 'puma'

# this is an optional gem, it provides a high performance replacement
# to String#blank? a method that is called quite frequently in current
# ActiveRecord, this may change in the future
gem 'fast_blank' #, github: "SamSaffron/fast_blank"

# this provides a very efficient lru cache
gem 'lru_redux'

# IMPORTANT: mini profiler monkey patches, so it better be required last
#  If you want to amend mini profiler to do the monkey patches in the railstie
#  we are open to it. by deferring require to the initializer we can configure disourse installs without it

gem 'flamegraph', git: 'git://github.com/SamSaffron/flamegraph.git', require: false
gem 'rack-mini-profiler', git: 'git://github.com/MiniProfiler/rack-mini-profiler.git', require: false

# used for caching, optional
gem 'rack-cors', require: false
gem 'unicorn'
gem 'puma'
gem "rake", '10.1.0'
gem 'bluepill'


# Configurations
gem 'configurate'


#gem 'friendly_id', :git => "git://github.com/FriendlyId/friendly_id.git" #, :branch => 'rails4'
gem "friendly_id" # Note: You MUST use 5.0.0 or greater for Rails 4.0+

# Authentication
gem "devise", github: "plataformatec/devise"
gem 'cancan'
gem 'rolify'

# Services
gem 'omniauth'
gem 'omniauth-openid'
gem 'openid-redis-store'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'omniauth-oauth2', require: false
gem 'omniauth-browserid', git: 'git://github.com/callahad/omniauth-browserid.git', branch: 'observer_api'
gem 'omniauth-cas'
gem 'omniauth-tumblr'
gem 'omniauth-wordpress'

# Tags
gem 'acts-as-taggable-on', '2.4.1'

# URIs and HTTP
gem 'addressable', '2.3.5', :require => 'addressable/uri'
gem 'faraday', '0.8.8'
gem 'faraday_middleware', '0.9.0'
gem 'typhoeus', '0.6.3'

# Views
gem "country_select"
gem 'awesome_nested_set', :git => 'git://github.com/collectiveidea/awesome_nested_set.git', :branch => 'master' # or any similar gem (gem 'nested_set')
gem "the_sortable_tree", :git => "git://github.com/the-teacher/the_sortable_tree.git"
#gem 'bootstrap-wysihtml5-rails', :require => 'bootstrap-wysihtml5-rails', :git => 'git://github.com/Nerian/bootstrap-wysihtml5-rails.git'
gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
gem "simple_form", git: 'git://github.com/plataformatec/simple_form.git'
gem 'turbolinks', github: 'rails/turbolinks'
#gem 'jquery-turbolinks'
#gem 'kaminari'
gem 'will_paginate', '~> 3.0.5'
gem 'paper_trail', '>= 3.0.0.beta1'
gem "haml-rails", github: 'indirect/haml-rails'
gem 'mobile-fu'


gem "rabl"
gem 'yajl-ruby', :require => "yajl"
gem "gon"
#gem "rabl-rails"
gem "js-routes"
gem 'responders'
gem 'paginate-responder'

gem 'rails_admin', git: 'git://github.com/sferik/rails_admin.git'
gem 'rails_admin_tag_list'

# we don't install these on travis to speed up test runs
group :production do
  # Administration
  #gem 'rails_admin', '0.4.9'

  # Analytics
  gem 'rack-google-analytics', '0.11.0', :require => 'rack/google-analytics'
  gem 'rack-piwik', '0.2.2', :require => 'rack/piwik'

  # Click-jacking protection
  gem 'rack-protection', '1.5.0'

  # Process management
  gem 'foreman', '0.62'

  # Redirects
  gem 'rack-rewrite', '1.3.3', :require => false
  gem 'rack-ssl', '1.3.3', :require => 'rack/ssl'

  # Third party asset hosting
  gem 'asset_sync', '1.0.0', :require => false
end

group :development do
  gem "annotate", github: "ctran/annotate_models"
  gem "letter_opener"
  #gem 'rack-mini-profiler'
  # Better errors handler
  gem 'better_errors'
  gem 'binding_of_caller'
  #gem 'metrical'
  #gem 'rails_best_practices'
  gem 'bullet'
  gem 'growl'
  #gem 'zeus'
  #gem 'spring'

  # Notification
  #gem 'rb-fsevent', require: darwin_only('rb-fsevent')
  #gem 'growl', require: darwin_only('growl')
  #gem 'rb-inotify', require: linux_only('rb-inotify')

  gem 'capistrano', '2.15.5'
  gem 'capistrano-ext', '1.2.1'
  gem 'meta_request'

  # Guard
  gem 'guard-rspec'
  #gem 'spork', '> 0.9.0.rc'
  #gem 'guard-spork'
  gem 'guard-livereload', github: "guard/guard-livereload"
  gem 'guard-rails'

  gem 'berkshelf', :github => 'RiotGames/berkshelf'
  gem 'knife-solo',
      :github => 'matschaffer/knife-solo',
      :branch => 'master',
      :submodules => true
  #gem 'berkshelf'

  #gem 'librarian-chef'

  #gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails'
end


# solr and friends
#gem "ransack", :git => "git://github.com/ernie/ransack.git"
gem 'sunspot_rails' #, :git => 'git://github.com/sunspot/sunspot'
gem 'sunspot_solr'

group :test do
  # RSpec (unit tests, some integration tests)

  gem 'fixture_builder', '0.3.6'
  gem 'fuubar', '1.1.1'
  gem 'rspec-instafail', '0.2.4', :require => false
  gem 'test_after_commit', '0.2.0'

  # Cucumber (integration tests)

  gem 'capybara'
  gem 'database_cleaner'
  #gem 'selenium-webdriver'

  # General helpers

  gem 'factory_girl_rails'
  #gem 'timecop'
  gem 'webmock', :require => false
  gem 'email_spec'
  gem "sunspot_test"
end


group :development, :test do
  gem "awesome_print"

  # Generate Fake data
  gem 'ffaker'

  #Seed data
  #gem 'seed-fu', github: 'mbleigh/seed-fu'

  # Cucumber (integration tests)
  gem 'cucumber-rails', :require => false

  gem 'rb-fsevent', require: RUBY_PLATFORM =~ /darwin/i ? 'rb-fsevent' : false
  gem 'rb-inotify', '~> 0.9', require: RUBY_PLATFORM =~ /linux/i ? 'rb-inotify' : false
  gem 'terminal-notifier-guard', require: false

  gem 'commands'

  # Jasmine (client side application tests (JS))
  gem 'jasmine', '1.3.2'
  gem 'sinon-rails', '1.7.3'

  #gem "rails_best_practices"

  gem 'mock_redis'
  gem 'listen', require: false
  gem 'certified', require: false
  gem 'fabrication', github: 'paulelliott/fabrication', require: false

  gem 'qunit-rails'
  gem 'mocha', require: false
  gem 'rspec-rails', require: false
  gem 'shoulda', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'rspec-given'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'

end

# perftools only works on 1.9 atm
group :profile do
  # travis refuses to install this, instead of fuffing, just avoid it for now
  #
  # if you need to profile, uncomment out this line
  # gem 'rack-perftools_profiler', require: 'rack/perftools_profiler', platform: :mri_19
end

#gem 'active_model_serializers'
#gem 'dotenv-rails', :groups => [:development, :test]
