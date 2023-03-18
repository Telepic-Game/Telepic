class ApplicationController < ActionController::Base
  helper_method :logged_in?

  before_action :set_logged_in

  def logged_in?
    session[:user_id].present?
  end

  private

  def set_logged_in
    @logged_in = logged_in?
  end
end

