class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      ## when user created and direct to users profile page
      session[:user_id] = @user.id

      redirect_to user_path(@user), notice: 'You signup successfully!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'You updated successfully!'
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
