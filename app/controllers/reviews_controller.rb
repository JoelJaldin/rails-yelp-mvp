class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    # antes de que se guarde en la linea siguiente, la variable @review quedará con los siguientes datos.
    # en teoria lo que estamos haciendo: @review.restaurant_id = 1, @review.content = "muy buen restaurant", @review.rating = 5
    # @review = Review.new(restaurant_id: 1, content: "muy buen restaurant", rating: 5)

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
