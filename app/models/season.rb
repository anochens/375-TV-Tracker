class Season < ActiveRecord::Base
  attr_accessible :series_item_id, :season_number, :start_date, :end_date, :description

  belongs_to :series_item
  validates :season_number, :presence => true,:numericality => true
  validates :series_item_id, :presence => true,:numericality => true
  validates_presence_of :start_date
end
