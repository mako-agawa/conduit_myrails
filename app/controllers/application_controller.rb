class ApplicationController < ActionController::Base
  include SessionsHelper
  # helper_method :current_user
  # before_action :current_user

  # before_action :set_current_user_if_development

  # def current_user
  #   puts "current_user"
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   puts @current_user
  #   puts @current_user.id
  #   puts @current_user.name
  # end

  # def logged_in?
  #   current_user.present?
  # end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def set_current_user_if_development
    puts "session[:user_id]"
    if Rails.env.development?
      session[:user_id] ||= 1
       puts session[:user_id]
    end
  end
end
