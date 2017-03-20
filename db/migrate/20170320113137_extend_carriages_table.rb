class ExtendCarriagesTable < ActiveRecord::Migration
  def change 
    change_table :carriages do |t|
      t.rename :category, :type
      t.integer :side_top_seats, default: 0
      t.integer :side_bottom_seats, default: 0
      t.integer :seats, default: 0
      t.integer :number
    end
  end
end
