# frozen_string_literal: true

class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      session[:forwarding_url] = request.original_url if request.get?
      redirect_to login_path, alert: 'Для нахождения на сайте пройдите регистрацию или войдите в систему'
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
