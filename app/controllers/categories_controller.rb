class CategoriesController < ApplicationController
  before_action :require_login

  def index
    @categories = Category.all
  end

  def trip
    @category = Category.find_by(id: params[:id])
    @trips = @category.trips
  end
end
