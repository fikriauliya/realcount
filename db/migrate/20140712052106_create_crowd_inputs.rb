class CreateCrowdInputs < ActiveRecord::Migration
  def change
    create_table :crowd_inputs do |t|
      t.integer :user_id
      t.integer :tps_id
      t.integer :prabowo_count
      t.integer :jokowi_count
      t.integer :broken_count
      t.text :problem

      t.timestamps
    end
  end
end
