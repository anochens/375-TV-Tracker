class SeriesItem < ActiveRecord::Base
	attr_accessible :channel_id, :name, :description, :remote_id

	validates_presence_of :name
	belongs_to :channel
	has_many :seasons, :dependent => :delete_all
	has_many :episodes, :through => :seasons
	
	scope :all, order(:name)

   #get n episodes from this series
	def episodes_n(n)
		episodes.all.recent.limit(n) || nil
	end	 

	#get n episodes from each of series_items
	def self.all_episodes_n(n,list_items)
		result = []
		list_items.sort_by{ |li| li.series_item.name }.each{|li| 
			li.series.episodes_n(n).each {|ep|
				result << ep unless ep.nil?
			}
		}

		result
	end	

	def to_s
		name
	end
end
