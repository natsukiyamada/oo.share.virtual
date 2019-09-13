class Comment < ApplicationRecord
	belongs_to :user, optional: true
    belongs_to :event
    belongs_to :unknown_user, optional: true
    validates :content, presence: true, length: { maximum: 200 }
end
