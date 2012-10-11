class Car
  include Mongoid::Document
  include Enumerize

  field :user_id, type: Integer
  field :brand #enumerize, check below
  field :model, type: String
  field :year, type: Integer
  field :color, type: String
  field :slug, type: String

  attr_accessible :brand, :model, :color, :user_id, :year


  validates :brand, :presence => true 
  validates :color, :presence => true
  validates :model, :presence => true
  validates :year,  :presence => true
  validates :user_id, :presence => true

  #relations
  belongs_to :user
  has_many :tanking_logs

  #enumerize
  enumerize :brand, :in => [:chevrolet, :mazda, :toyota, :chrysler, :hyundai, :ford]

  #callbacks

  before_save :generate_slug


  def self.by_slug(slug)
    self.where(slug: slug).first
  end

  private 

  def generate_slug
    self.slug = [self.brand, self.model].join(" ").parameterize
  end


end
