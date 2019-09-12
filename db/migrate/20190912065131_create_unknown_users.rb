class CreateUnknownUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :unknown_users do |t|
      t.timestamps
    end
  end
end
