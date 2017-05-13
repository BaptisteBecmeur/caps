class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :picture)

  end


end
