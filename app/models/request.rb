class Request < ApplicationRecord
  belongs_to :patient, class_name: 'User', foreign_key: 'patient_id'
  belongs_to :hospital_treatment
  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
