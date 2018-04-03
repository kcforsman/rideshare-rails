class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])
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
    @driver = Driver.find_by(id: params[:id])
    @driver.trips.each do |trip|
      trip.destroy
    end
    if @driver.destroy
      redirect_to drivers_path

    else
      render :show
    end
  end

end
