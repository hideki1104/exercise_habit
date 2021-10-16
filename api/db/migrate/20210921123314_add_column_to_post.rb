class AddColumnToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :training_id, :bigint
    add_column :posts, :set_count, :integer
  end
end
