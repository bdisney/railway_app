class Search
  include ActiveModel::Model

  attr_accessor :start_station_id, :end_station_id
  attr_reader :result

  validates :start_station_id, :end_station_id, presence: true
  validate :stations_differences

  def start_station
    @start_station ||= RailwayStation.find(start_station_id)
  end

  def end_station
    @end_station ||= RailwayStation.find(end_station_id)
  end

  def run
    @start_station = RailwayStation.find(start_station_id)
    @end_station = RailwayStation.find(end_station_id)

    if valid?
      @result = Train.includes(route: :railway_stations).where(railway_stations: { id: start_station_id }) &
          Train.includes(route: :railway_stations).where(railway_stations: { id: end_station_id })
    end
  end

  private

  def stations_differences
    errors.add(:base, 'Станции отправления и прибытия должны отличаться.') if start_station_id == end_station_id
  end
end