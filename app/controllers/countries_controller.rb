class CountriesController < ApplicationController
  before_action :require_login

  def index
    @countries = Country.all
  end

  def trip
    @country = Country.find_by(id: params[:id])
    @trips = @country.trips
  end
end
