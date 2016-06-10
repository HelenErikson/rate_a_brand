class UsersController < ApplicationController
  def index
     @users = User.all
  end

  def show
     @users = User.find(params[:id])
     @brands = current_user.rated_brands
  end

end
