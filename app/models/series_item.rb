class SeriesItem < ActiveRecord::Base
	attr_accessible :channel_id, :name, :description, :remote_id

	validates_presence_of :name
	belongs_to :channel
	has_many :seasons, :dependent => :delete_all
	has_many :episodes, :through => :seasons
	
	scope :all, order(:name)

	def to_s
		name
	end
end
