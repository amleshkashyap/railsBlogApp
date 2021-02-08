class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # basic version, doesn't actually create the entry in DB
    # @article = Article.new(title: "...", body: "...")
    # modified version with support for filtering params
    @article = Article.new(article_params)

    # create the entry in DB
    if @article.save
      # Use redirect_to after DB mutations to avoid repeating mutations - it makes a new request
      redirect_to @article
    else
      # Use render to render the specified view for the current request only
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private
    # just for filtering the parameters
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
