class Season < ActiveRecord::Base
  attr_accessible :series_item_id, :season_number, :start_date, :end_date, :description

  belongs_to :series_item
  has_many :episodes
  
  validates :season_number, :presence => true,:numericality => true
  validates :series_item_id, :presence => true,:numericality => true
  validates_presence_of :start_date

  def to_s
    "#{series_item.to_s}: Season #{season_number}"
  end

end
