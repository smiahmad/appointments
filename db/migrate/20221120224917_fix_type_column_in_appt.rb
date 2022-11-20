class FixTypeColumnInAppt < ActiveRecord::Migration[7.0]
  def change
    rename_column :gate_appointments, :type, :tranType
  end
end
