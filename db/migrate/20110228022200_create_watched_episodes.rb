class CreateWatchedEpisodes < ActiveRecord::Migration
  def self.up
    create_table :watched_episodes do |t|
      t.integer :user_id
      t.integer :episode_id
      t.timestamps
    end
  end

  def self.down
    drop_table :watched_episodes
  end
end
