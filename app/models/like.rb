class Like < ApplicationRecord
	#optional :true → belongs_toの外部キーのnilを許可
    belongs_to :user, optional: true
    belongs_to :comment
    belongs_to :unknown_user, optional: true
end
