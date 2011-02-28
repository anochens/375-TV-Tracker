class SeriesItem < ActiveRecord::Base
  attr_accessible :channel_id, :name, :description

  validates_presence_of :name
  belongs_to :channel
  has_many :seasons, :dependent => :delete_all

  def to_s
    name
  end  
end