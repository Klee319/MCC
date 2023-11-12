class AddProfileBackgroundImageIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_background_image_id, :string
  end
end
