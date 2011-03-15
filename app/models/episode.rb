class Episode < ActiveRecord::Base
  attr_accessible :season_id, :episode_number, :duration, :air_date, :start_est, :start_cst, :start_pst, :description, :name, :imdb_id

  validates :season_id, :presence => true, :numericality => true
  validates :episode_number, :presence => true, :numericality => true

  belongs_to :season
  has_one :series_item, :through => :season
  has_many :watched_episodes

  scope :all, joins(:season).order("season_number DESC, episode_number DESC")
  
  def series
     series_item
  end

  def seen(current_id)
     watched_episodes.all.select{|we| we.user_id == current_id}.size > 0
  end

  def description_small
	  if !description.nil? && description.length>20
		  "#{description[0..20]}..."
	  else
	  	  description
	  end      
  end

  def to_s
     "#{series}: Episode #{episode_number}"
  end
end
