class Channel < ActiveRecord::Base
  attr_accessible :name

  has_many :series_items, :order => "series_items.name ASC", :dependent => :delete_all
  validates_presence_of :name

  scope :all, order(:name)

  def to_s
     name
  end
end
