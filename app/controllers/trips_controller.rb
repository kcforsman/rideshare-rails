class TripsController < ApplicationController

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      trip = Trip.create_new_trip(passenger)
      if trip.save
        redirect_to passenger_path(params[:passenger_id])
      else
        # needs to display an error message
        render passenger_path(params[:passenger_id])
      end
      # display some error to let them know it did work
    end
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
