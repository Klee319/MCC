class ChangeColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :Users, :grade, :string
  end
end
