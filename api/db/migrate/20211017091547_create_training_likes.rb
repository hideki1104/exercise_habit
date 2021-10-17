class CreateTrainingLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :training_likes do |t|
      t.references :user
      t.references :training

      t.timestamps
    end
  end
end
