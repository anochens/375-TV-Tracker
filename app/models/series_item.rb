class SeriesItem < ActiveRecord::Base
	attr_accessible :channel_id, :name, :description, :remote_id

	validates_presence_of :name
	belongs_to :channel
	has_many :seasons, :dependent => :delete_all
	has_many :episodes, :order => "episodes.name ASC", :through => :seasons
	
	scope :all, order(:name)

	def unseen_episodes(current_id = -1)
		unseen = episodes.reject{|e| e.seen(current_id)}
		all = episodes.map{|e| "#{e} (seen=#{e.seen(current_id)})"}

		#using a set union here lets us use the ordering from scopes
		Episode.all & unseen
	end

	def to_s
		name
	end
end
