class RatingsController < ApplicationController
before_action :authenticate_user!

  def index
    @ratings = Rating.all
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new
    @rating.user_id = params[:user_id]
    @rating.brand_id = params[:brand_id]
    @rating.body = params[:body]

    if @rating.save
      redirect_to "/ratings", :notice => "Rating created successfully."
    else
      render 'new'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])

    @rating.user_id = params[:user_id]
    @rating.brand_id = params[:brand_id]
    @rating.body = params[:body]

    if @rating.save
      redirect_to "/ratings", :notice => "Rating updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @rating = Rating.find(params[:id])

    @rating.destroy

    redirect_to "/ratings", :notice => "Rating deleted."
  end
end
