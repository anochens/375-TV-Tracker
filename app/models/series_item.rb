class SeriesItem < ActiveRecord::Base
  attr_accessible :channel_id, :name, :description

  validates_prescence_of :name
  belongs_to :channel
end
