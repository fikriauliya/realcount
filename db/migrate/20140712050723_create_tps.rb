class CreateTps < ActiveRecord::Migration
  def change
    create_table :tps do |t|
      t.string :desa
      t.string :kelurahan_id
      t.string :tps_id

      t.timestamps
    end
  end
end
