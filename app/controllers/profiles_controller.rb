class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!

  def show
    redirect_to new_profile_path unless @profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @user = User.find(current_user)
    @profile = Profile.new(profile_params)
    @profile.user = @user
    if @profile.save
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :city, :zip_code, :country_code, :phone_number, :description, :photo, :photo_cache)
  end

  def set_profile
    @profile = Profile.find_by(user_id: params[:id])
  end
end
