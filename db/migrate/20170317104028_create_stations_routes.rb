class CreateStationsRoutes < ActiveRecord::Migration
  def change
    create_join_table :railway_stations, :routes do |t|
      t.index :railway_station_id
      t.index :route_id
    end
  end
end
