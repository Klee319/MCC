class ChangeColumnToStorylines < ActiveRecord::Migration[7.0]
  def change
    add_column :storylines, :private, :boolean, default: true
  end
end
