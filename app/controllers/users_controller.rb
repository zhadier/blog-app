class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user_current = User.find(params[:id])
  end
end
