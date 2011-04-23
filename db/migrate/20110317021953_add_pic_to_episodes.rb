class AddPicToEpisodes < ActiveRecord::Migration
  def self.up
    add_column :episodes, :picture_url, :string
  end

  def self.down
    remove_column :episodes, :picture_url
  end
end
