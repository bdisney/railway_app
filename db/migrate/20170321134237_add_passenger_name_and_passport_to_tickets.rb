class AddPassengerNameAndPassportToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :passenger_name, :string
    add_column :tickets, :passport_number, :string
  end
end
