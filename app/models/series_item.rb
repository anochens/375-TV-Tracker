class SeriesItem < ActiveRecord::Base
  attr_accessible :channel_id, :name, :description

  validates_presence_of :name
  belongs_to :channel, :dependent => :delete

  def to_s
    name
  end  
end
