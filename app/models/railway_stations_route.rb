class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 
  
  validates :railway_station_id, uniqueness: { scope: :route_id }
end