class WatchedEpisode < ActiveRecord::Base
  attr_accessible :user_id, :episode_id

  belongs_to :user
  belongs_to :episode
end
