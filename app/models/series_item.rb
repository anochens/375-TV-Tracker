class SeriesItem < ActiveRecord::Base
  attr_accessible :channel_id, :name, :description, :remote_id

  validates_presence_of :name
  belongs_to :channel
  has_many :seasons, :dependent => :delete_all
  has_many :episodes, :through => :seasons


  def unseen_episodes(current_id = -1)
     unseen = episodes.reject{|e| e.seen(current_id)}
     all = episodes.map{|e| "#{e} (seen=#{e.seen(current_id)})"}

     p "episodes=#{all}"
     unseen
  end

  def to_s
    name
  end  
end
