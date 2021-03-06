class TripsController < ApplicationController

  def show
    @edit = true if params[:edit]
    @errors = params[:errors]
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
    elsif params[:passenger_id]
      @passenger = Passenger.find_by(id: params[:passenger_id])
    end
    @trip = Trip.find_by(id: params[:id])
  end

  def create
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trip = Trip.create_new_trip(passenger)
      if !@trip.nil? && @trip.save
        path = passenger_trip_path(params[:passenger_id], @trip.id)
      else
        error = "No driver available at this time"
        path = passenger_path(params[:passenger_id], error: error)
      end
      redirect_to path
      # display some error to let them know it did work
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
    if params[:passenger_id]
      redirect_to passenger_trip_path(params[:passenger_id], params[:id], edit: true)
    else
      render :show
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if params[:passenger_id]
      if @trip.update(trip_params)
        redirect_to passenger_trip_path(params[:passenger_id], params[:id])
      else
        render :show
      end
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
