class GateAppointment < ApplicationRecord
  belongs_to :user
  validates :nbr, presence: true, numericality: { only_integer: true }
  validates :tranType, presence: true
  validates :day, presence: true
end
