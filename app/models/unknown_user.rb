class UnknownUser < ApplicationRecord
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
end
