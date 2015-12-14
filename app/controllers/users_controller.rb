class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @goals = @user.goals.paginate(:page => params[:page])
    @title = @user.username
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to @user, notice: 'User successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update user_params
      redirect_to @user, notice: 'User successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User successfully destroyed.'
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
