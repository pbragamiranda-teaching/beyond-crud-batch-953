class ReviewsController < ApplicationController
  before_action :set_restaurant, except: :destroy

  def new
    @review = Review.new
  end

  def create
    # create new review
    @review = Review.new(review_params)
    # assign review to restaurant
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
