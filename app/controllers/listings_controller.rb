class ListingsController < ApplicationController
  before_action :require_login
  before_action :set_listing, only: [:edit, :update, :destroy]

  def new
    @listing = Listing.new
    @listing.trip = Trip.find_by(id: params[:trip_id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.trip = Trip.find_by(id: params[:trip_id])
    if @listing.save
      flash[:message] = "#{@listing.trip.title} has been added to your To-Do list"
      redirect_to trip_path(@listing.trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    if @listing.save
      flash[:message] = "#{@listing.trip.title} listing has been updated"
      redirect_to trip_path(@listing.trip)
    else
      render :edit
    end
  end

  def destroy
    if @listing
      @listing.destroy
      flash[:message] = "The trip has been removed from your To-Do list"
      redirect_to todolists_path
    else
      flash[:danger] = "The trip could not be removed"
      render 'trips/trip'
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:todolist_id, :user_id, :user_status, :user_season, :fav)
  end

  def set_listing
    @listing = Listing.find_by(id: params[:id])
  end
end
