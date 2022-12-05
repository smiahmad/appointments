class AddOtherFieldsToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :gate_appointments, :truck_license, :string
    add_column :gate_appointments, :eq_type, :string
    add_column :gate_appointments, :line_id, :string
  end
end
