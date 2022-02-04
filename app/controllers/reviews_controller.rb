class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    respond_to do |format|
      if @review.save
        # redirects to an anchor on the show page. So when a user creates a new review, it will be added to the bottom of the page. Also the URL will be updated with the new review #id.
        redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}")
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.' }
        format.json #will look for a file called create.json in the reviews views folder
      else
        render format.html { 'restaurants/show' }
        format.json # will look for a file called create.json in the reviews view folder
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
