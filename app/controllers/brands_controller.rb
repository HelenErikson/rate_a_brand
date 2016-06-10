class BrandsController < ApplicationController

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
    @brand = Brand.find(params[:id])
  end

  def update
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
    @brand = Brand.find(params[:id])

    @brand.destroy

    redirect_to "/brands", :notice => "Brand deleted."
  end
end
