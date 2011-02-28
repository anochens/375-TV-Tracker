class ListItem < ActiveRecord::Base
  attr_accessible :user_id, :series_item_id, :watched
  
  belongs_to :series_item
  belongs_to :user
  
  validates :user_id, :presence => true,:numericality => true
  validates :series_item_id, :presence => true,:numericality => true
  

  def series
     series_item
  end

  def to_s
    "Series: #{series}"
  end
end
