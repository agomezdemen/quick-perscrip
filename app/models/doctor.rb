class Doctor < ApplicationRecord
    has_secure_password

    has_many :prescriptions
    has_many :drugs, through: :prescriptions

    has_many :appointments
    has_many :patients, through: :appointments
end
