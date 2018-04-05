class TripsController < ApplicationController

  def show
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
    elsif params[:passenger_id]
      @passenger = Passenger.find_by(id: params[:passenger_id])
    end
    @trip = Trip.find_by(id: params[:id])
  end

  # def new
  #   @trip = Trip.new
  # end

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
    @trip = Trip.find_by(id: params[:id])
    if params[:passenger_id]
      path = passenger_path(params[:passenger_id])
    else
      path = trip_path(params[:id])
    end
    if @trip.update(trip_params)
      redirect_to path
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    if params[:driver_id]
      path = driver_path(params[:driver_id])
    elsif params[:passenger_id]
      path = passenger_path(params[:passenger_id])
    end
    if @trip.destroy
      redirect_to path
    else
      render :show
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:rating)
  end
end
