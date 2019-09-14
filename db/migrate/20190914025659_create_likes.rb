class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.references :unknown_user, foreign_key: true
      t.timestamps
      t.index [:user_id, :event_id], unique: true
      t.index [:unknown_user_id, :event_id], unique: true
    end
  end
end
