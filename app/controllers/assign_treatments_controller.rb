class AssignTreatmentsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])

    @hospital_treatments = @hospital.hospital_treatments.where.not(treatment_id: nil)
    @doctors = @hospital.doctors.uniq

    @treatment_not_added = Treatment.all.where.not(id: @hospital_treatments.pluck(:treatment_id))
  end

  def add_treatment
    hospital_treatment = HospitalTreatment.find_or_create_by(hospital_id: params[:hospital_id],
                                                             treatment_id: params[:assign_treatment_id], doctor_id: params[:doctor_id])
    hospital_treatment.update(price: params[:price])

    redirect_to hospital_assign_treatments_path, notice: 'Treatment status has been updated.'
  end

  def remove_treatment
    HospitalTreatment.find_by(hospital_id: params[:hospital_id], treatment_id: params[:treatment_id],
                              doctor_id: params[:doctor_id]).destroy
    redirect_to hospital_assign_treatments_path, notice: 'Treatment remove has been updated.'
  end
end
