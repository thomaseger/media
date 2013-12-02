class MediaItem < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	
  belongs_to :type
  belongs_to :user

  attr_accessible :link, :title, :type, :user, :borrowed_from

  validates_presence_of :type, :user, :title

  def self.search(title)
  	search_condition = "%" + title + "%"
 	find(:all, :conditions => ['lower(title) LIKE lower(?)', search_condition], :order => 'title')
  end
end
