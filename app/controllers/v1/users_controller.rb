class V1::UsersController < ApplicationController
 
  def index
    render json: User.all
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: 201, message: 'user created successfully!' , content: {user: @user}}
    else
      render json: { error: 401, message: ' user cannot be processed !'}
    end
  end

  private

  def user_params
    params.permit(:username)
  end
end
