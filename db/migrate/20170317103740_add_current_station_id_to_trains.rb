class AddCurrentStationIdToTrains < ActiveRecord::Migration
  def change
    add_belongs_to :trains, :current_station
  end
end
