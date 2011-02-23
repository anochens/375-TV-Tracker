class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.integer :season_id
      t.integer :episode_number
      t.integer :duration
      t.date :air_date
      t.integer :start_est
      t.integer :start_cst
      t.integer :start_pst
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
