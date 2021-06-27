class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.float :weight
      t.bigint :user_id

      t.timestamps
    end
  end
end
