class CreateSeasons < ActiveRecord::Migration
  def self.up
    create_table :seasons do |t|
      t.integer :series_item_id
      t.integer :season_number
      t.date :start_date
      t.date :end_date
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :seasons
  end
end
