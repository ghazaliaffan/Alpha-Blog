class ArticlesController < ApplicationController
  def show
    @articles = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @articles = Article.new
  end

  def edit
    @articles = Article.find(params[:id])
  end


  def create
    @articles = Article.new(params.require(:article).permit(:title, :description))
    if @articles.save
      redirect_to @articles
    else
      render 'new'
    end
  end

  def update
    @articles = Article.find(params[:id])
    if @articles.update(params.require(:article).permit(:title, :description))
      redirect_to @articles
      flash[:notice] = "Article has been updated"
    else
      render 'edit'
    end
  end
end
