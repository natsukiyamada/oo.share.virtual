class Event < ApplicationRecord
	belongs_to :user
    has_many :comments, dependent: :destroy
    
    validates :user_id, presence: true 
	validates :name, presence: true
    validates :event_code, presence: true, uniqueness: true
    validates :content, length: { maximum: 200 }
end
