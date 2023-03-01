class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :treatments
  has_many :hospitals
  has_many :patient_requests, class_name: 'Request', foreign_key: 'patient_id'

  has_many :hospital_treatments
  has_many :treatments, through: :hospital_treatments

  # has_many
  has_many :doctor_requests, through: :hospital_treatments, source: :doctor

  enum user_type: { Admin: 0, Doctor: 1, Patient: 2 }

  validates_presence_of :name, :user_type

  def first_name
    name.split.first
  end

  def last_name
    name.split.lasts
  end

  def doctor_requests
    hospital_treatments_ids = HospitalTreatment.where(doctor: self).pluck(:id)
    Request.where(hospital_treatment_id: hospital_treatments_ids)
  end
end
