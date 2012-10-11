class TankingController < ApplicationController

  def index
  end

  def show
  end

  def new
    @car = Car.by_slug(params[:car_id])
  end

  def create
    @tanking_log = TankingLog.new(params[:tanking_log])

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
