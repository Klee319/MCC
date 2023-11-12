class CreateTalkrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :talkrooms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :storyline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
