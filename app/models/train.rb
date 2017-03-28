class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def capacity_by_type(carriage_type, seat_type)
    Carriage.where(type: carriage_type).sum(seat_type) || 0
  end

  def ordered_carriages
    order_from_tail ? carriages.ordered.reverse_order : carriages.ordered
  end
end
