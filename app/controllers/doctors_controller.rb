class DoctorsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @doctor_added = @hospital.doctors.uniq
    @doctor_not_added = User.where(user_type: 'Doctor').where.not(id: @hospital.doctors.pluck(:id))
  end

  def add_doctor
    HospitalTreatment.create!(hospital_id: params[:hospital_id], doctor_id: params[:doctor_id])

    redirect_to hospital_doctors_path, notice: 'User status has been updated.'
  end

  def remove_doctor
    HospitalTreatment.where(hospital_id: params[:hospital_id], doctor_id: params[:doctor_id]).destroy_all

    redirect_to hospital_doctors_path, notice: 'User remove has been updated.'
  end
end
