
namespace :tanking_logs do
  desc "a lot of refuelings ... "
  task :populate => :environment do

    # field :car_id, type: Integer
    # field :cost, type: Float
    # field :date, type: Date
    # field :gallon, type: Float
    # field :gas_station_id, type: Integer
    # field :km, type: Integer

    gas_stations = GasStation.all || []
    cars = Car.all || []
    
    cost_by_station = {}

    gas_stations.map do |gs|
      cost_by_station[gs.name.parameterize] = rand(100) + 1
    end

    gas_stations.each do |gs|
      cars.each do |c|
        gallon = rand(10) + 1

        conf = {
          car_id: c.id,
          cost: cost_by_station[gs.name.parameterize] * gallon,
          date: (DateTime.now.to_date - 30).upto(DateTime.now).to_a.sample,
          gallon: rand(100) + 1,
          km: rand(100) + 1,
          gas_station_id: gs.id
        }

        tl = TankingLog.create!(conf)
      end
    end

  end
end
