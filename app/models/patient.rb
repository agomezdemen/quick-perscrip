class Patient < ApplicationRecord
    has_secure_password

    has_many :appointments
    has_many :doctors, through: :appointments

    has_many :prescriptions
    has_many :drugs, through: :prescriptions

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
end
