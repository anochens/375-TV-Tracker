class SeriesItem < ActiveRecord::Base
	attr_accessible :channel_id, :name, :description, :remote_id

	validates_presence_of :name
	belongs_to :channel
	has_many :seasons, :dependent => :delete_all
	has_many :episodes, :through => :seasons
	
	scope :all, order(:name)

   #get n episodes from this series
	def episodes_n(n,watched_episodes = nil)
		recent = episodes.all.recent
		return [] if recent.nil?
				
		unless episodes.nil?
			recent.reject!{|e| watched_episodes.include?(e)} 
		end	

		return recent[0...n];
	end	 


	#get n episodes from each of list_item.series_items
	def self.all_episodes_n(n,list_items = nil, watched_episodes = nil)
		result = []
		
		# not logged in 
		if(list_items.nil?) 
			SeriesItem.all[0..30].each{|si|
				si.episodes_n(n).each {|ep|
					result << ep unless ep.nil?
				}
			}
		else	
			watched_episodes ||= []
			list_items.sort_by{ |li| li.series.name }.each{|li| 
				li.series.episodes_n(n,watched_episodes).each {|ep|
					result << ep unless ep.nil?
				}
			}
		end	

		result
	end	

	def to_s
		name
	end
end
