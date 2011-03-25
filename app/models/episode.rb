class Episode < ActiveRecord::Base
  attr_accessible :season_id, :episode_number, :duration, :air_date, :start_est, :start_cst, :start_pst, :description, :name, :imdb_id, :picture_id

  validates :season_id, :presence => true, :numericality => true
  validates :episode_number, :presence => true, :numericality => true

  belongs_to :season
  has_one :series_item, :through => :season
  has_many :watched_episodes

  scope :all, joins(:season).order("seasons.season_number DESC, #{table_name}.episode_number DESC")
  scope :recent, where("#{table_name}.air_date > ? ", 2.years.ago.to_datetime)
  
  def series
     series_item
  end

  def description_small
	  if !description.nil? && description.length>90
		  "#{description[0..90]}..."
	  else
	  	  description
	  end      
  end

  def to_s
     "#{series}: Episode #{episode_number}"
  end
end
