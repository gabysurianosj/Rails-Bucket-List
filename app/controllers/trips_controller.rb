class TripsController < ApplicationController
  before_action :require_login
  before_action :set_trip, only: [:trip, :edit, :update]
  before_action :created_by_current_user, only: [:edit, :update]
  helper_method :current_user

  def index
    @user = User.find_by(id: params[:user_id])
    if @user
      @trips = @user.trips.uniq
    else
      @trips = Trip.all
    end
  end

  def trip
    @listings = @trip.trips_todolists_by_user(current_user.id)
  end

  def new
    @trip = Trip.new
    @listings = @trip.listings.build
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:message] = "#{@trip.title} has been created"
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      flash[:message] = "#{@trip.title} has been updated"
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def search
    @trips = Trip.search(params[:query])
    render :index
  end

  def behind
    @trips = Trip.behind_on(params[:user_id])
    render :index
  end

  private
  def trip_params
    params.require(:trip).permit( :title,
                                  :description,
                                  :country_id,
                                  :day,
                                  :time,
                                  :season,
                                  :created_by, #?
                                  category_ids:[],
                                  category_attributes:[:name],
                                  country_attributes:[:name])
  end

  def set_trip
    @trip = Trip.find_by(id: params[:id])
  end

  def created_by_current_user
    unless @trip.created_by == current_user.id
      flash[:danger] = "You cannot edit this trip because you did not create it!"
      redirect_to trip_path(@trip)
    end
  end
end
