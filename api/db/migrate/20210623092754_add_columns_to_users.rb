class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :height, :float
    add_column :users, :sex, :integer, default:0
    add_column :users, :birthday, :date
    add_column :users, :training_type, :integer, default:0
  end
end
