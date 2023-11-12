class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tag
      t.string :tag_type
      t.integer :storyline_id
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
