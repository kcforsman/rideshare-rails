class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end

  end

  def new
    @driver = Driver.new
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
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


  private
  def driver_params
    params.require(:driver).permit(:name,:vin)
  end

end
