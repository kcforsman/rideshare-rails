class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end

  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
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

  def unavailable
    @driver = Driver.find_by(id: params[:id])
    if @driver.driver_status.class == String
      @driver.driver_status = nil
    else
      @driver.driver_status = "Unavailable"
    end
    @driver.save
    redirect_to driver_path(@driver.id)
  end

  private
  def driver_params
    params.require(:driver).permit(:name,:vin)
  end

end
