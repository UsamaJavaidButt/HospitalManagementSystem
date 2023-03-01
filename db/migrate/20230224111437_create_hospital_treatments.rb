class CreateHospitalTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :hospital_treatments do |t|
      t.integer :price

      t.timestamps
    end
  end
end
