class Hospital < ApplicationRecord
  has_many :hospital_treatments, dependent: :destroy
  has_many :treatments, through: :hospital_treatments
  has_many :doctors, through: :hospital_treatments
end
