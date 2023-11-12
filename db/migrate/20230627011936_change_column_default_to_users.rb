class ChangeColumnDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :grade, :string, default: "Normal"
  end
end
