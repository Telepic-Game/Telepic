class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  before_action :set_logged_in

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def set_logged_in
    @logged_in = logged_in?
  end
end

