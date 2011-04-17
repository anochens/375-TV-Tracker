class Episode < ActiveRecord::Base
  attr_accessible :season_id, :episode_number, :duration, :air_date, :start_est, :start_cst, :start_pst, :description, :name, :imdb_id

  validates :season_id, :presence => true, :numericality => true
  validates :episode_number, :presence => true, :numericality => true

  belongs_to :season
  has_one :series_item, :through => :season
  has_many :watched_episodes
  has_many :ratings

  scope :all, joins(:season).order("seasons.season_number DESC, #{table_name}.episode_number DESC")
  scope :recent, where("#{table_name}.air_date > ? ", 5.years.ago.to_datetime)

  def picture_url
     series_item.image_url
  end   

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
  
  def average_stars
	 avg = 0.0
	 ratings.each{|r| avg += r.stars}
    avg /= ratings.size
    avg
  end

  def search_summary
     "#{name} (#{series_item.to_s})"
  end   
end
