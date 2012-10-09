class Car
  include Mongoid::Document
  field :user_id, type: Integer
  field :brand, type: String
  field :model, type: String
  field :year, type: Integer
  field :color, type: String

  attr_accessible :brand, :model, :color, :user_id, :year


  validates :brand, :presence => true 
  validates :color, :presence => true
  validates :model, :presence => true
  validates :year,  :presence => true  

  #relations
  belongs_to :user
  has_many :tanking_logs

end
