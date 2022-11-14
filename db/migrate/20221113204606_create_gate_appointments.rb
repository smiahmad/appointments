class CreateGateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :gate_appointments do |t|
      t.integer :nbr
      t.string :eqId
      t.string :iso
      t.string :orderNbr
      t.string :releaseNbr
      t.string :trkcId
      t.string :type
      t.datetime :day

      t.timestamps
    end
  end
end
