class Channel < ActiveRecord::Base
  attr_accessible :name

  has_many :series_items, :dependent => :delete_all
  validates_presence_of :name

  def to_s
     name
  end
end
