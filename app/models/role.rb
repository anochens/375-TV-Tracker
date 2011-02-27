class Role < ActiveRecord::Base
  attr_accessible :series_item_id, :actor_id, :description, :character_name

  belongs_to :series_item
  belongs_to :actor
  
  validates :series_item_id, :presence => true,:numericality => true
  validates :actor_id, :presence => true,:numericality => true
  validates_presence_of :character_name

  def series
     series_item
  end

  def to_s
    "Role: #{character_name}"
  end

end
