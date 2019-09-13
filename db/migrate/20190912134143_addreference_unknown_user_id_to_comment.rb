class AddreferenceUnknownUserIdToComment < ActiveRecord::Migration[5.2]
  def change
  	add_reference :comments, :unknown_user, foreign_key: true
  end
end
