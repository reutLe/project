class ApplicationController < ActionController::Base
  before_action :login?, :except => [:login, :new, :create]
  protect_from_forgery with: :exception

  def login?
    redirect_to login_users_path if session[:login].nil?
  end
end
