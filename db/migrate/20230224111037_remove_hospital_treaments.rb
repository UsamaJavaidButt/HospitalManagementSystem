class RemoveHospitalTreaments < ActiveRecord::Migration[7.0]
  def change
    drop_table :hospital_treaments
  end
end
