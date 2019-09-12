class AddIndexAndUniqueToEventCode < ActiveRecord::Migration[5.2]
  def change
  	add_index :events, :event_code, unique: true
  end
end
