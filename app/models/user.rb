class User < ApplicationRecord
    has_many :party_users
    has_many :parties, through: :party_users

    validates :password_digest, presence: true
    has_secure_password
end
