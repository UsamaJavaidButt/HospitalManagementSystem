class AddHospitalRefereceToHospitalTreatment < ActiveRecord::Migration[7.0]
  def change
    add_reference :hospital_treatments, :hospital, foreign_key: true
  end
end
