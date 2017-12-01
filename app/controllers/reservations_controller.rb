class ReservationsController < ApplicationController
  # def new
  # end

  def create
    authenticate_user!
    user = User.find(current_user)
    if user.profile
      @reservation = Reservation.new(reservation_params)
      @reservation.profile = user.profile
      @reservation.status = 'pending'
      @reservation.collection_item_id = params["collection_item_id"]
      price_per_day = CollectionItem.find(params["collection_item_id"]).price_per_day
      if @reservation.start_day != nil && @reservation.end_day != nil
        @reservation.final_price = calculate_final_price(@reservation.start_day, @reservation.end_day, price_per_day)
      else
        flash[:alert] = 'You did not fill the calendar !'
      end
      unless @reservation.save
        redirect_to collection_item_path(params[:collection_item_id])
      end
    else
      # Return is necessary for the redirect_to to work
      # Indeed, the redirection doesn't work if it isn't the last instruction of the controller method
      flash[:alert] = 'To rent a book, you need to fill your profile first'
      redirect_to new_profile_path
      return
    end
  end

  # def edit

  # end

  # def update
  #   fail
  # end

  def accept
    reservation = Reservation.find(params[:id])
    if params[:accept] == "true"
      reservation.update(status: "accepted")
    else
      reservation.update(status: "aeclined")
    end
    redirect_to dashboards_dashboard_main_path
  end

  def index_borrowed
  end

  def index_lended
  end

  def show
  end

  def final_price
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_day, :end_day)
  end

  def calculate_final_price(start_day, end_day, price_per_day)
    price_per_day = 0 if price_per_day.nil?
    days = end_day - start_day
    final_price = (days * price_per_day)
  end
end
