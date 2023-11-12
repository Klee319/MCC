class AddUserIdToRelationships < ActiveRecord::Migration[7.0]
  def change
    add_column :relationships, :user_id, :integer
  end
end
