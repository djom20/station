class GasStation
  include Mongoid::Document
  field :name, type: String

  attr_accessible :name
  

  #relations
  has_many :tanking_logs

  #validations
  validates :name, :presence => true
  validates :name, :uniqueness => true


  def self.expensivest
    t = nil
    exp = 0
    self.all.each do |gs|
      c = 0
      (TankingLog.where(:gas_station => gs) || []).each do |tl|
        c+=tl.cost
      end

      if(exp < c)
        t = gs
        exp = c
      end
      
    end

    t

  end

  def self.most_yield
    t = nil
    exp = 0
    self.all.each do |gs|
      c = 0
      (TankingLog.where(:gas_station => gs) || []).each do |tl|
        c+=tl.km
      end

      if(exp < c)
        t = gs
        exp = c
      end
      
    end

    t
  end

end
