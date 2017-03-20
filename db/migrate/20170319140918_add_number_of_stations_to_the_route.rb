class AddNumberOfStationsToTheRoute < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :id, :primary_key
    add_column :railway_stations_routes, :position, :integer, default: 0
  end
end
