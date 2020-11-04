class ReviewsController < ApplicationController
  before_action :set_restaurant

  # get /restaurants/:restaurant_id/reviews/new
  def new
    @review = Review.new
  end

  # post '/restaurants/:restaurant_id/reviews'
  # params = { review: { content: '' } }
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Your review was added!'
      # redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
