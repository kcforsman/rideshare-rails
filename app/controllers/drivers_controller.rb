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

  def delete
  end
end
