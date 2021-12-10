class ReviewsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @order = Order.find(params[:order_id])
    @review.order = @order
    if @review.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
