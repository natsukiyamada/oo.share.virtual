class User < ApplicationRecord
	has_many :events, dependent: :destroy

	has_secure_password

	validates :name, presence: true
    validates :mail, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
