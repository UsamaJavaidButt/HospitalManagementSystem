class AddDoctorIdToHospitalTreatment < ActiveRecord::Migration[7.0]
  def change
    add_column :hospital_treatments, :doctor_id, :bigint
  end
end
