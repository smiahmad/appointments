class CreateTruckingCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :trucking_companies do |t|
      t.string :code
      t.string :name
      t.string :scac_code
      t.timestamps
    end
  end
end
