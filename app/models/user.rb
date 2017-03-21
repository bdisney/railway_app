class User < ActiveRecord::Base
  has_many :tickets

  validates :last_name, presence: true
  validates :first_name, presence: true
end 