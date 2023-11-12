class RemoveUserIdFromStorylines < ActiveRecord::Migration[7.0]
  def change
    remove_column :storylines, :users_id, :integer
  end
end
