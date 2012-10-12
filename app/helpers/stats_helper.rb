module StatsHelper
  def build_expense_info()
    data = [["Car", "Total Cost"]]
    (Car.all || []).each do |car|
      sum = 0
      (TankingLog.where(:car => car).all || []).each do |tl|
        sum += tl.cost
      end
      data.push([car.slug, sum])
    end

    data
  end

  def build_gas_stations_info
    data = [["Gas Station", "Total Cost"]]
    (GasStation.all || []).each do |gs|
      sum = 0
      (TankingLog.where(:gas_station => gs).all || []).each do |tl|
        sum += tl.cost
      end
      data.push([gs.name, sum])
    end

    data
  end

end
