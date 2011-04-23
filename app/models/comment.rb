class Comment < ActiveRecord::Base
  belongs_to :episode

  validates_presence_of :body
end
