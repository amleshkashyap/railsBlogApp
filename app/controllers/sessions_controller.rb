class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password_digest])
      sessions[:user_id] = @user.id
      redirect_to '/articles'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def welcome
  end
end
