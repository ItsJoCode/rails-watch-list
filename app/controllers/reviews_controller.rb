class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new create]

  def create
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render '/list/show', status: :unprocessable_entity
    end
  end

  private

  def set_review
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :list_id)
  end
end
