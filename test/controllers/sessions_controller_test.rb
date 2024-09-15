require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(name: "Test User", email: "user@example.com", password: "password", password_confirmation: "password")
  end

  test "should get login" do
    puts "========="  # IDを確認
    puts @user.id  # IDを確認
    puts "========="  # IDを確認
    # ログインページが表示されるか確認
    get login_path
    assert_response :success
  end

  # test "should log in with valid information" do
  #   # ログインリクエストを送る
  #   puts "========="  # IDを確認
  #   puts @user.id  # IDを確認
  #   puts "========="  # IDを確認

  #   post login_path, params: { session: { email: @user.email, password: @user.password } }
  #   # ログイン後、ユーザーのshowページにリダイレクトされるか確認
  #   assert_redirected_to user_path(@user) # user_path(@user)を明示的に指定

  #   # リダイレクト先のページを取得
  #   follow_redirect!

  #   # users/showが表示されているか確認
  #   assert_template 'users/show/'

  #   # ログイン状態を確認
  #   assert is_logged_in?

  # end

  test "should not log in with invalid information" do
    # 無効な情報でログインを試みる
    post login_path, params: { session: { email: @user.email, password: "wrong_password" } }

    # 再度ログインページが表示されるか確認
    assert_template "sessions/new"

    # フラッシュメッセージが表示されているか確認
    assert_not flash.empty?
  end

  test "should log out" do
    puts "========="  # IDを確認
    puts @user.id  # IDを確認
    puts "========="  # IDを確認
    # ログインしてからログアウトを確認
    post login_path, params: { session: { email: @user.email, password: "password" } }
    assert is_logged_in?

    delete logout_path
    assert_not is_logged_in?

    # ログアウト後のリダイレクトを確認
    assert_redirected_to users_path
    follow_redirect!
  end
end
