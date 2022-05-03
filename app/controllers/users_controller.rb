class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_current = User.find(params[:id])
  end
end
