class AddUserToGateAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :gate_appointments, :user_id, :int
  end
end