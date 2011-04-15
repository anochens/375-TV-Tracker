class ListItem < ActiveRecord::Base
	attr_accessible :user_id, :series_item_id
	
	belongs_to :series_item
	belongs_to :user
	
	validates :user_id, :presence => true,:numericality => true
	validates :series_item_id, :presence => true,:numericality => true

	scope :alpha_asc, joins(:series_item).order("series_items.name ASC")
	scope :alpha_desc, joins(:series_item).order("series_items.name DESC")
	scope :all, alpha_asc

	def series
		series_item
	end

	def to_s
		"Series: #{series}"
	end
end
