class GasStation
  include Mongoid::Document
  field :name, type: String

  attr_accessible :name
  

  #relations
  has_many :tanking_logs

  #validations
  validate :name, :presence => true
end
