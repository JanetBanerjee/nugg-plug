class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params.required(:review).permit(:comment, :name, :store_id, :user_id))

    @review.name = current_user.name
    @review.user_id = current_user.id


    if @review.save!
      redirect_back(fallback_location: stores_path)
    else
      render stores_path
    end
  end
end
