class AddOrderingToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :order_from_tail, :boolean, default: false
  end
end
