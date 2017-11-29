class CollectionItemsController < ApplicationController
  def index
    @collection_items = CollectionItem.all
  end

  def show
    @collection_item = CollectionItem.find(params[:id])
  end

  def new
    @collection_item = CollectionItem.new
  end

  def create
    @collection_item = CollectionItem.new(collection_item_params)
      if @collection_item.save
        redirect_to collection_item_path(@collection_item)
      else
        render :new
      end
  end

  def edit
    @collection_item = CollectionItem.find(params[:id])
  end

  def update
    @collection_item = CollectionItem.update(collection_item_params)
    redirect_to collection_item_path(@collection_item)
  end

  def destroy
    collection_item = CollectionItem.find(params[:id])
    collection_item.destroy
    redirect_to collection_items_path
  end

  private

  def collection_item_params
    params.require(:collection_item).permit(:book_id, :description, :price_per_day, :edition, :quality)
  end
end
