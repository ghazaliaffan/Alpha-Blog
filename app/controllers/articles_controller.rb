class ArticlesController < ApplicationController
  def show
    @articles = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @articles = Article.new(params.require(:article).permit(:title, :description))
    @articles.save
    redirect_to article_path(@articles)
  end

end
