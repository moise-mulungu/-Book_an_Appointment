class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :show]
  def index
    @users = User.all
  end
  def new
    @user=User.new
  end

end
