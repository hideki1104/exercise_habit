class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.bigint :user_id
      t.bigint :training_id
      t.integer:set_count

      t.timestamps
    end
  end
end
