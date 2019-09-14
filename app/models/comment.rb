class Comment < ApplicationRecord
	has_many :likes, dependent: :destroy
	belongs_to :user, optional: true
    belongs_to :event
    belongs_to :unknown_user, optional: true
    validates :content, presence: true, length: { maximum: 200 }
    
    #↓コメントインスタンスがcurrent_user（ここ重要）のlikeを持っているかを判定するメソッド
    #
    def liked_by_user?(user)
        likes.where(user_id: user.id).exists?
    end
    
    def liked_by_unknown_user?(user)
        likes.where(unknown_user_id: user.id).exists?
    end
end
