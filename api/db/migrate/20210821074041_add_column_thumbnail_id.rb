class AddColumnThumbnailId < ActiveRecord::Migration[6.1]
  def change
    add_column :trainings, :thumbnail_id, :string
  end
end
