class ArticlesController < ApplicationController

  # basic authentication, do for all methods except index and show
  # http_basic_authenticate_with name: "randomUser", password: "randomPassword", except: [:index, :show]

  skip_before_action :authorized, only: [:index, :show]

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

    # actual call to update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    # delete the article
    @article.destroy

    redirect_to root_path
  end

  private
    # just for filtering the parameters
    def article_params
      # mandatory for the form data captured in the Hash "params" to have a field article, which in turn should have title and body only
      # these are also accessible directly using params[:article][:title] and params[:article][:body]
      # "bin/rails generate migration AddStatusToArticles status:string" => create this migration to later add a new field to an existing model
      params.require(:article).permit(:title, :body, :status)
    end
end
