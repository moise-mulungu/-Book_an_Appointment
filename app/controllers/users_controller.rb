class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :show]
  def index
    @users = User.all
  end
  def new
    @user=User.new
  end

 def create
   @user=User.new(user_params)
   if @user.save
    ## when user created and direct to users profile page
    session[:user_id]=@user.id

    redirect_to user_path(@user), notice:'You signup successfully!'
   else
    render 'new'
   end
  end
  def update 
    if @user.update( user_params)
      redirect_to users_path, notice:'You updated successfully!'
    else
      render 'edit'
    end
  end

 

 
end
