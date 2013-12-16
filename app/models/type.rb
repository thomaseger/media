class Type < ActiveRecord::Base
  	
  has_many :media_items

  attr_accessible :name
  
  validates_uniqueness_of :name

end
