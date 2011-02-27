class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.integer :series_item_id
      t.integer :actor_id
      t.text :description
      t.string :character_name
      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
