class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(
      make: params[:review][:make],
      model: params[:review][:model],
      camera_review: params[:review][:camera_review],
      conclusion: params[:review][:conclusion]
    )
    @review.save
    redirect_to '/reviews' # list
  end


  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(
      make: params[:review][:make],
      model: params[:review][:model],
      camera_review: params[:review][:camera_review],
      conclusion: params[:review][:conclusion]
    )
    @review.save
    redirect_to "/reviews/#{@review.id}"
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to '/reviews'
  end

end
