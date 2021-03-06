class StationsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @stations = GasStation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @stations}
    end
  end

  def show
  end

  def new
  end

  def create
    @station = GasStation.new(params[:station])

    @station.save

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @station}
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
