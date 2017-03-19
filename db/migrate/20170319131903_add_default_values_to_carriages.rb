class AddDefaultValuesToCarriages < ActiveRecord::Migration
  def change
    change_column_default :carriages, :top_seats, 0
    change_column_default :carriages, :bottom_seats, 0
  end
end
