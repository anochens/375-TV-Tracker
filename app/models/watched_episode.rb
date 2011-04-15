class WatchedEpisode < ActiveRecord::Base
  attr_accessible :user_id, :episode_id

  belongs_to :user
  belongs_to :episode

  validates :episode_id, :presence => true, :uniqueness => true
  validates_presence_of :user_id
end
