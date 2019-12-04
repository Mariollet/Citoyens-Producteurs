class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :product_appointments, dependent: :destroy
  has_many :products, through: :product_appointments
end