class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.string :category
      t.integer :top_seats
      t.integer :bottom_seats
      t.belongs_to :train

      t.timestamps
    end
  end
end
