class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @collection_item = CollectionItem.find(params[:collection_item_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @collection_item = CollectionItem.find(params[:collection_item_id])
    @user = User.find(current_user.id)
    @review.profile = @user.profile
    @review.collection_item = @collection_item
    if @review.save
      redirect_to @collection_item
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content)
  end
end
