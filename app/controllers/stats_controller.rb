class StatsController < ApplicationController

  include StatsHelper

  def expense

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => build_expense_info}
    end

  end

  def gas_stations
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => build_gas_stations_info}
    end
  end

end
