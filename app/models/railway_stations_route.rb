class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 
  
  validates :railway_station_id, uniqueness: { scope: :route_id }

   validates :arrival_time, :departure_time, format: {
      with: /\A([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?\z/, allow_blank: true }
end