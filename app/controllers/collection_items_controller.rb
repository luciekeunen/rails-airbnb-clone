class CollectionItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    # @profiles = Profile.near(params[:city], 10)
    if params[:city].nil?
      @profiles = Profile.all.where.not(latitude: nil, longitude: nil)
    elsif (Profile.near(params[:city], 10)).empty? && (params[:city].size > 1)
      flash[:notice] = "We didn't find any book around this city. Take a look at books elsewhere!"
      @profiles = Profile.all.where.not(latitude: nil, longitude: nil)
    else
      @profiles = Profile.near(params[:city], 10).where.not(latitude: nil, longitude: nil)
    end
    @markers = Gmaps4rails.build_markers(@profiles) do |profile, marker|
      marker.lat profile.latitude
      marker.lng profile.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
    @collection_items = @profiles.map { |profile| profile.collection_items }.flatten
  end

  def show
    @collection_item = CollectionItem.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    user = User.find(current_user)
    if user.profile
      @collection_item = CollectionItem.new
    else
      flash[:alert] = 'To add a book, you need to fill your profile first'
      redirect_to new_profile_path
    end
  end

  def create
    params[:collection_item][:price_per_day] = params[:collection_item][:price_per_day].to_f * 100
    @collection_item = CollectionItem.new(collection_item_params)
    if Book.find_by(title: params["collection_item"]["title"])
      @book = Book.find_by(title: params["collection_item"]["title"])
    else
      picture = Cloudinary::Uploader.upload("#{params["collection_item"]["photo"]}",
      :public_id => "#{params["collection_item"]["title"].chars[0..10].shuffle.join.delete(" ")}")
      @book = Book.create(
        title: params["collection_item"]["title"],
        synopsis: params["collection_item"]["synopsis"],
        author: params["collection_item"]["author"],
        photo: picture["url"],
        genre: params["collection_item"]["genre"]
        )
    end
    @collection_item.book_id = @book.id
    user = current_user
    @collection_item.profile_id = user.profile.id
    if @collection_item.save
      redirect_to dashboards_my_books_path
    else
      render :new
    end
  end

  def edit
    @collection_item = CollectionItem.find(params[:id])
  end

  def update
    @collection_item = CollectionItem.update(collection_item_params)
    redirect_to dashboards_my_books_path
  end

  def destroy
    authenticate_user!
    collection_item = CollectionItem.find(params[:id])
    collection_item.destroy
    redirect_to collection_items_path
  end

  private

  def collection_item_params
    params.require(:collection_item).permit(:description, :price_per_day, :edition, :quality, :title)
  end
end
