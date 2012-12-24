class ApplicationController < ActionController::Base
  protect_from_forgery
  include Errship::Rescuers
  include Errship::ActiveRecord::Rescuers # or replace 'ActiveRecord' with MongoMapper, or Mongoid
end
