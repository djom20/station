class CarsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
  end

  def show
    @car = Car.by_slug(params[:car_id])
  end

  def new
  end

  def create
    @car = Car.new(params[:car])
    @car.user = current_user

    if @car.save
      flash[:notice] = "Car was created successfully!"
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
