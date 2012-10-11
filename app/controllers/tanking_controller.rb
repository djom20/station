class TankingController < ApplicationController

  before_filter :authenticate_user!

  def index
  end

  def show
  end

  def new
    @car = Car.by_slug(params[:car_id])
  end

  def create
    @car = Car.by_slug(params[:car_id])
    @gas_station = GasStation.where(:name => params[:tanking_log][:gas_station]).first

    @tanking_log = TankingLog.new(params[:tanking_log])
    @tanking_log.car = @car
    @tanking_log.gas_station = @gas_station if @gas_station
    
    if @tanking_log.save
      flash[:notice] = "tanking_log was created successfully!"
      redirect_to dashboard_url
    else
      flash[:notice] = "Oops, try again"
      redirect_to :new
    end
    
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

end
