class CreateStorylines < ActiveRecord::Migration[7.0]
  def change
    create_table :storylines do |t|
      t.string :tags
      t.string :title
      t.string :subject
      t.string :image
      t.boolean :private, null: false, default: false
      t.integer :users_id
      t.integer :post_id
      t.timestamps
    end
  end
end
