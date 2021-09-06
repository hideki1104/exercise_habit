class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :url
      t.integer:training_type,limit:1
      t.bigint :genre_id
      t.integer:difficuly_type,limit:1

      t.timestamps
    end
  end
end
