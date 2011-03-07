class Season < ActiveRecord::Base
  attr_accessible :series_item_id, :season_number, :start_date, :end_date, :description

  belongs_to :series_item
  has_many :episodes, :dependent => :delete_all
  
  validates :season_number, :presence => true,:numericality => true
  validates :series_item_id, :presence => true,:numericality => true

  def series
     series_item
  end

  def to_s
    "Season #{season_number}"
  end

  def extended_to_s
    "#{series}, Season #{season_number}"
  end
 
end
