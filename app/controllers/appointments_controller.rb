class AppointmentsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @hospital_treatments = @hospital.hospital_treatments.where.not(treatment_id: nil)
    @doctors = @hospital.doctors.uniq
    @appointment_requests = current_user.doctor_requests.includes(:hospital_treatment)
    @treatment_not_added = Treatment.all.where.not(id: @hospital_treatments.pluck(:treatment_id))

    # Requests
    @requests = Request.where(hospital_treatment_id: @hospital_treatments.pluck(:id))
    @request_added = @requests.where(patient_id: current_user.id)
    @request_not_added = @hospital_treatments.where.not(id: @requests.pluck(:hospital_treatment_id))
  end

  def create
    appointment_request = Request.create(patient_id: current_user.id,
                                         hospital_treatment_id: params[:hospital_treatment_id])

    redirect_to hospital_appointments_path, notice: 'Request status has been updated.'
  end

  def destroy
    appointment = Request.find_by(id: params[:id], patient_id: current_user.id).destroy

    redirect_to hospital_appointments_path, notice: 'Request delete has been updated.'
  end

  def appointment_requests
    @appointment_requests = current_user.appointment_requests
  end

  def accept
    appointment_request = Request.find(params[:id])
    appointment_request.accepted!

    redirect_to hospital_appointments_path, notice: 'Appointment request has been accepted.'
  end

  def reject
    appointment_request = Request.find(params[:id])
    appointment_request.rejected!

    redirect_to hospital_appointments_path, notice: 'Appointment request has been rejected.'
  end
end
