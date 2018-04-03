class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
  end

  def new
    # @passenger = Passenger.new
  end

  def create

  end

  def edit
    # @passenger = Passenger.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    @passenger = Passenger.find_by(id: params[:id])
    @passenger.trips.each do |trip|
      trip.destroy
    end
    if @passenger.destroy
      redirect_to passengers_path
    else
      render :show
    end
  end
end
