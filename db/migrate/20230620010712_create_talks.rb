class CreateTalks < ActiveRecord::Migration[7.0]
  def change
    create_table :talks do |t|

      t.string :mesage
      t.integer :mension_user
      t.string :image
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
