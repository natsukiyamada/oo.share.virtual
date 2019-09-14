class AddReferenceCommentToLike < ActiveRecord::Migration[5.2]
  def up
    remove_column :likes, :event_id
    add_reference :likes, :comment, foreign_key: true
  end

  def down
    add_reference :likes, :comment, foreign_key: true
  end
end
