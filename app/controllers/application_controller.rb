class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_breadcrumb :home, :root_path
  protect_from_forgery with: :exception
end
