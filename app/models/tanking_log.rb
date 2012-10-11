class TankingLog
  include Mongoid::Document
  field :car_id, type: Integer
  field :cost, type: Float
  field :date, type: Date
  field :gallon, type: Float
  field :gas_station_id, type: Integer
  field :km, type: Integer


  attr_accessible :car_id, :cost, :date, :gallon, :gas_station_id, :km

  #validations

  validates :cost, :presence => true
  validates :date, :presence => true 
  validates :gallon, :presence => true
  validates :km, :presence => true

  validates_numericality_of :cost, :gallon
  validates :km, numericality: {only_integer: true}

  #relations

  belongs_to :car
  belongs_to :gas_station

end
