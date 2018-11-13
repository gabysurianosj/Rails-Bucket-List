class TodolistsController < ApplicationController
  before_action :require_login
  before_action :set_user_todolist, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @todolists = current_user.todolists
    @favorites = current_user.favorite_trips
  end

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = @user.todolists.build(todolist_params)
    if @todolist.save
      redirect_to todolist_path(@todolist)
      flash[:message] = "New ToDolist Created!"
    else
      render :new
    end
  end

  def trip
    @trips = @todolist.trips
  end

  def edit
  end

  def update
    @todolist.update(todolist_params)
    if @todolist.save
      redirect_to todolist_path(@todolist)
      flash[:message] = "#{@todolist.name} updated!"
    else
      render :edit
    end
  end

  def destroy
    if @todolist
      @todolist.destroy
      redirect_to todolists_path
      flash[:message] = "Your ToDolist has been deleted"
    else
      render :trip
      flash[:danger] = "This ToDolist could not be deleted"
    end
  end

  private
  def todolist_params
    params.require(:todolist).permit(:name, :description, :user_id)
  end

  def set_user_todolist
    @todolist = Todolist.find_by(id: params[:id])
    unless @todolist.user == current_user
      flash[:danger] = "This is not your ToDolist!"
      redirect_to todolists_path
    end
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end
