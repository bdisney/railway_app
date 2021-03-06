class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :user

  validates :serial_number, :passenger_name, :passport_number, presence: true
  validates :passenger_name, length: { minimum: 3, maximum: 50 }
  validates :passport_number, format: {with: /\A[[:digit:]]{4}[\s]+[[:digit:]]{6}\z/}

  before_validation :gen_serial_number, on: :create

  after_create :send_buy_notification
  after_destroy :send_cancel_notification

  private

  def gen_serial_number
    self.serial_number = rand(9**10).to_s
  end

  def send_buy_notification
    TicketsMailer.buy_ticket(self).deliver_now
  end

  def store_ticket_data
    @ticket_data = {serial_number: serial_number, user: user}
  end

  def send_cancel_notification
    TicketsMailer.cancel_ticket(self).deliver_now
  end
end