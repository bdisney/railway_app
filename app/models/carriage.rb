class Carriage < ActiveRecord::Base
  self.inheritance_column = :foo

  TYPES = { CoupeCarriage: 'Coupe', EconomyCarriage: 'Economy', BusinessClassCarriage: 'Business - Class', SittingCarriage: 'Sitting' }
  SEATS_TYPES = { bottom_seats: 'Bottom', top_seats: 'Top', side_bottom_seats: 'Side bottom',
                  side_top_seats: 'Side top', seats: 'Seats' }
  belongs_to :train
  
  validates :train_id, presence: true
  validates :number, numericality: { only_integer: true, greater_than: 0 }
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number, on: :create

  scope :ordered, -> { order(:number) }
  scope :ordered_by_train, -> { joins(:train).order('trains.number, carriages.number') }

  def self.types
    TYPES.invert
  end

  def self.permited_params
    [:type, :train_id, :number]
  end

  def type_label
    TYPES.fetch(type.to_sym)
  end

  protected

  def set_number
    max_number = train.carriages.maximum(:number) || 0
    self.number = max_number + 1
  end
end