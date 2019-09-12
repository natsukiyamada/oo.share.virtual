class AddColumnContentToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :content, :string
  end
end
