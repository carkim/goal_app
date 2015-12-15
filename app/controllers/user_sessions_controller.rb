class UserSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to goals_path
    else
      render action :new, notice: 'Login failed.'
    end
  end

  def destroy
    logout
    redirect_to(:goals, notice: 'Logged out!')
  end

end
