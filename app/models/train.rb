class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def capacity_by_categories
    capacity = {}

    Carriage::CATEGORIES.each_key { |key| capacity[key] = { carriages: 0, top_seats: 0, bottom_seats: 0 } }
    
    carriages.each do |carriage|
      category = carriage.category.to_sym
      capacity[category][:carriages] += 1
      capacity[category][:top_seats] += carriage.top_seats
      capacity[category][:bottom_seats] += carriage.bottom_seats
    end

    capacity

  end
end
