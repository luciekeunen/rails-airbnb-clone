class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :check_profile

  def dashboard_main
    collection_items = @user.profile.collection_items
    collection_items.each do |collection_item|
      @reservations = collection_item.reservations
    end
  end

  def inbox
  end

  def my_books
    @collection_items = @user.profile.collection_items
  end

  def my_rentals
    @rentals = @profile.reservations
  end

  private

  def set_user
    @user = User.find(current_user)
  end

  def check_profile
    if @user.profile
      @profile = @user.profile
    else
      flash[:alert] = "To access this page, you need to fill your profile first"
      redirect_to new_profile_path
    end
  end
end
