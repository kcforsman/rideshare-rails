class TripsController < ApplicationController

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    # @trip = Trip.new(trip_params)
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    if @trip.destroy
      redirect_to drivers_path
    else
      render :show
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:rating)
  end
end
