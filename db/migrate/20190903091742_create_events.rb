class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true, null: false
      t.string :event_code, unique: true
      t.timestamps
    end
  end
end
