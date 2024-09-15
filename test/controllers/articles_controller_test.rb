class ArticleControllerTest < ActionDispatch::IntegrationTest
    # テスト用ユーザーと記事をセットアップ
    setup do
      # テスト用のユーザーと記事を作成
      @user = User.create!(name: "Test User", email: "user@example.com", password: "password", password_confirmation: "password")
      @other_user = User.create!(name: "Other User", email: "other@example.com", password: "password", password_confirmation: "password")
      @article = Article.create!(title: "Test Article", body: "This is a test article body.", user: @user)

      # テストでログインユーザーをシミュレート
      log_in_as(@user)
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should show article" do
      get article_url(@article)
      assert_response :success
    end

    test "should get new" do
      get new_article_url
      assert_response :success
    end

    test "should create article with valid parameters" do
      assert_difference("Article.count") do
        post articles_url, params: { article: { title: "New Article", body: "This is a new article body.", user_id: @user.id } }
      end
      assert_redirected_to article_path(Article.last)
    end

    test "should not create article with invalid parameters" do
      assert_no_difference("Article.count") do
        post articles_url, params: { article: { title: "", body: "", user_id: @user.id } }
      end
      assert_response :unprocessable_entity
    end

    test "should get edit" do
      get edit_article_url(@article)
      assert_response :success
    end

    test "should update article" do
      patch article_url(@article), params: { article: { title: "Updated Title", body: "Updated body" } }
      assert_redirected_to article_path(@article)
      @article.reload
      assert_equal "Updated Title", @article.title
      assert_equal "Updated body", @article.body
    end

    test "should not update article with invalid parameters" do
      patch article_url(@article), params: { article: { title: "", body: "" } }
      assert_response :unprocessable_entity
    end

    test "should destroy article" do
      assert_difference("Article.count", -1) do
        delete article_url(@article)
      end
      assert_redirected_to articles_url
    end
end
