class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email], password_digest: params[:password])
    if @user # && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/articles'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def welcome
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
