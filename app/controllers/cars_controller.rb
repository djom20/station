class CarsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @cars = Car.all
  end

  def show
    @car = Car.by_slug(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    #binding.pry
    @car = Car.new(params[:car])
    @car.user = current_user

    if @car.save
      flash[:notice] = "Car was created successfully!"
      redirect_to dashboard_url
    else
      flash[:notice] = "Oops, try again"
      redirect_to new_car_url
    end

  end

  def edit
    @car = Car.by_slug(params[:id])
  end

  def update
    
    @car = Car.by_slug(params[:id])

    if (@car)
      @car.update_attributes(params[:car] || [])
      flash[:notice] = "Car was updated successfully!"
      redirect_to car_url(@car.slug)
    else
      flash[:notice] = "Oops, try again"
      redirect_to dashboard_url
    end
  end

  def delete
  end

  def destroy
    
    @car = Car.by_slug(params[:id])

    @car.destroy if @car
    redirect_to cars_url

  end

  def preview
    @car = Car.by_slug(params[:id])

    render :layout => false
  end
   
end
