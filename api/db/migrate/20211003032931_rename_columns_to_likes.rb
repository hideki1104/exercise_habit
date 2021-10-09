class RenameColumnsToLikes < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :post_id_id, :post_id
    rename_column :likes, :user_id_id, :user_id
  end
end
