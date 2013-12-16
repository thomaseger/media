class Type < ActiveRecord::Base
  has_many :media_items  
  validates_uniqueness_of :name
end
