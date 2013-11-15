class Type < ActiveRecord::Base
  	include ActiveModel::ForbiddenAttributesProtection
  	
  has_many :media_items

  attr_accessible :name
  
  validates_uniqueness_of :name

end
