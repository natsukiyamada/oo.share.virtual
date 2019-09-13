class ChangeColumnUserIdAtCommentTable < ActiveRecord::Migration[5.2]
  def change
  	change_column :comments, :user_id, :bigint, null: true
  end
end
