
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

    (DateTime.now.to_date - 10).upto(DateTime.now.to_date) do |date|
      gas_stations.each do |gs|
        [cars.sample].each do |c|
          gallon = rand(10) + 1
          prev = TankingLog.where(:car => c, :gas_station => gs, :date => date-1).first
          
          km_prev = if prev
            prev.km
          else
            1000
          end

          conf = {
            car_id: c.id,
            cost: cost_by_station[gs.name.parameterize] * gallon,
            date: date,
            gallon: rand(100) + 1,
            km: km_prev + rand(100) + 20,
            gas_station_id: gs.id
          }

          tl = TankingLog.create!(conf)
        end
      end
    end

  end
end
