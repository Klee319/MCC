class ChangeColumnDefaultToStorylines < ActiveRecord::Migration[7.0]
  def change
    remove_column :storylines, :private, :boolean
  end
end
