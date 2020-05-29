class Doctor < ApplicationRecord
    has_secure_password

    belongs_to :license

    has_many :prescriptions
    has_many :drugs, through: :prescriptions

    has_many :appointments
    has_many :patients, through: :appointments

    validates :license_id, uniqueness: true
end
