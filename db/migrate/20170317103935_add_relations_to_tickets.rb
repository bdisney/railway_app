class AddRelationsToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :train
    add_belongs_to :tickets, :start_station
    add_belongs_to :tickets, :end_station
    add_belongs_to :tickets, :user
  end
end
