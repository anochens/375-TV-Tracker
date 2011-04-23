class CreateSeriesItems < ActiveRecord::Migration
  def self.up
    create_table :series_items do |t|
      t.integer :channel_id
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :series_items
  end
end
