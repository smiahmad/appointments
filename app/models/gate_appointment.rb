class GateAppointment < ApplicationRecord
  belongs_to :user
  validates :nbr, presence: true, numericality: { only_integer: true }
  validates :tranType, presence: true, length: {minimum: 2, maximum: 2}
  validates :eqId, length: {maximum: 11}
  validates :truck_license, length: {maximum: 15}

  validates :day, presence: true

  before_save { self.eqId = eqId.upcase }
  before_save { self.iso = iso.upcase }
  before_save { self.orderNbr = orderNbr.upcase }
  before_save { self.tranType = tranType.upcase }
  before_save { self.lineId = lineId.upcase }
end
