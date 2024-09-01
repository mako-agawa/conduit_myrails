class ArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  def new

    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_article
  end

  def update
    set_article
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_article
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :body, :tag)
  end

end
