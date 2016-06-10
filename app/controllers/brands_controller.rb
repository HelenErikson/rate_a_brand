class BrandsController < ApplicationController

  before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, :only => [:index]

  def current_user_must_be_owner
      @brand = Brand.find(params[:id])

      if @brand.user != current_user
        redirect_to root_url, :alert => "Not authorized for that"
      end
  end

  def my_likes
      @brands = current_user.rated_brands
  	end


  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @comment = Comment.new
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new
    @brand.name = params[:name]
    @brand.image_url = params[:image_url]
    @brand.user_id = params[:user_id]
    @brand.review_id = params[:review_id]

    if @brand.save
      redirect_to "/brands", :notice => "Brand created successfully."
    else
      render 'new'
    end
  end

  def edit
    current_user_must_be_owner
    @brand = Brand.find(params[:id])
  end

  def update
    current_user_must_be_owner
    @brand = Brand.find(params[:id])

    @brand.name = params[:name]
    @brand.image_url = params[:image_url]
    @brand.user_id = params[:user_id]
    @brand.review_id = params[:review_id]

    if @brand.save
      redirect_to "/brands", :notice => "Brand updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    current_user_must_be_owner
    @brand = Brand.find(params[:id])

    @brand.destroy

    redirect_to "/brands", :notice => "Brand deleted."
  end
end
