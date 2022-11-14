class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gate_appointments

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end

end
