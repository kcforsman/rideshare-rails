class TripsController < ApplicationController

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
