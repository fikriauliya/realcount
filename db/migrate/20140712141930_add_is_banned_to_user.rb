class AddIsBannedToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_banned, :boolean, default: false
  end
end
