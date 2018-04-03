class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
  end

  def edit
  end

  def delete
  end

  def create
  end

  def new
  end

  def update
  end
end
