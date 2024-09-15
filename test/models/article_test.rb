require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  def setup
    # テスト用ユーザーを作成
    @user = User.create(name: "Test User", email: "user@example.com", password: "password", password_confirmation: "password")
  end
  test "is valid with valid attributes" do
    article = Article.new(title: "Valid Title", body: "This is a valid body with more than ten characters.", user: @user)
    assert article.valid?
  end

  test "is not valid without a title" do
    article = Article.new(title: nil, body: "This is a valid body.", user: @user)
    assert_not article.valid?
  end

  test "is not valid without a body" do
    article = Article.new(title: "Valid Title", body: nil, user: @user)
    assert_not article.valid?
  end
end
