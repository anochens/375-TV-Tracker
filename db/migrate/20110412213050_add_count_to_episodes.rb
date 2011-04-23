class AddCountToEpisodes < ActiveRecord::Migration
  def self.up
    add_column :episodes, :ratings_count, :integer, :default => 0
    # update any existing records at time of migration
    execute "UPDATE episodes SET ratings_count = (SELECT COUNT(*) FROM ratings WHERE episode_id = episodes.id)"
  end

  def self.down
    remove_column :episodes, :ratings_count
  end
end