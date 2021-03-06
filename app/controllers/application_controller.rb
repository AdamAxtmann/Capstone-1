class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :session_expiry
  before_filter :update_activity_time

  include SessionsHelper

  def session_expiry
    get_session_time_left
    unless @session_time_left > 0
      sign_out
      deny_access 'Your session has timed out. Please log back in.'
    end
  end

  def update_activity_time
    session[:expires_at] = 30.minutes.from_now
  end

  #def current_user
  #  @current_user ||= User.find_by_remember_token!(cookies[:remember_token]) if cookies[:remember_token]
  #end

  private

  def get_session_time_left
    expire_time = session[:expires_at] || Time.now
    @session_time_left = (expire_time - Time.now).to_i
  end
end
