class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def create
    @article = Article.create(article_params)
    redirect_to article_path(@article)
  end

  def edit
  end

  def new
    @article = Article.new
  end


  def update
    @article.update(article_params)
    redirect_to article_path(@article.id)

  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  def index
    @articles = Article.all
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
