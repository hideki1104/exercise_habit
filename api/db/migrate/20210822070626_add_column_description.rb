class AddColumnDescription < ActiveRecord::Migration[6.1]
  def change
    add_column :trainings, :description, :string
  end
end
