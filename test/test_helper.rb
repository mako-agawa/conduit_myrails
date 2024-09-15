# test/test_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # ヘルパーメソッドでログイン状態を確認
  def is_logged_in?
    !session[:user_id].nil?
  end

    # ログインをシミュレートするメソッド
    def log_in_as(user)
      post login_path, params: { session: { email: user.email, password: 'password' } }
    end
end
