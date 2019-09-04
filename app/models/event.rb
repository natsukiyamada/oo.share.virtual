class Event < ApplicationRecord
	belongs_to :user

	validates :name, presence: true
    validates :event_code, presence: true, uniqueness: true
end
