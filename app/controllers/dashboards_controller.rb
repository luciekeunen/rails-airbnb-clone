class DashboardsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user

  def dashboard_main
    user = User.find(current_user)
    collection_items = user.profile.collection_items
    collection_items.each do |collection_item|
      @reservations = collection_item.reservations
    end
  end

  def inbox
  end

  def my_books
  end

  def my_rentals
  end

  private

  def set_user
    user = User.find(current_user)
  end
end
