class AddNameAndImdbIdToEpisodes < ActiveRecord::Migration
  def self.up
    add_column :episodes, :name, :string
    add_column :episodes, :imdb_id, :string
  end

  def self.down
    remove_column :episodes, :imdb_id
    remove_column :episodes, :name
  end
end
