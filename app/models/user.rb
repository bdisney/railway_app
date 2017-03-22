class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tickets

  validates :last_name, presence: true
  validates :first_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end 