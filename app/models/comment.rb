class Comment < ApplicationRecord
	belongs_to :user
    belongs_to :event
    belongs_to :unknown_user
    validates :content, presence: true, length: { maximum: 200 }
end
