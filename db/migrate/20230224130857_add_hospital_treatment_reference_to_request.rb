class AddHospitalTreatmentReferenceToRequest < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :hospital_treatment, foreign_key: true
  end
end
