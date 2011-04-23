class Rating < ActiveRecord::Base
  belongs_to :episode, :counter_cache => true
end
