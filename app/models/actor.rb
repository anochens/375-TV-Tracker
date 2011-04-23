class Actor < ActiveRecord::Base
  attr_accessible :last_name, :first_name, :description
  
  has_many :roles, :dependent => :delete_all
  
  validates_presence_of :last_name, :first_name

  def to_s
    "#{first_name} #{last_name}"
  end
end
