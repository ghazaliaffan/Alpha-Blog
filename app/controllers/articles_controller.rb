class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @articles = Article.new
  end

  def edit
  end


  def create
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to @articles
    else
      render 'new'
    end
  end

  def update
    if @articles.update(article_params)
      redirect_to @articles
      flash[:notice] = "Article has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @articles.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @articles = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
