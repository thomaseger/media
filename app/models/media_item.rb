class MediaItem < ActiveRecord::Base
	
  belongs_to :type
  belongs_to :user

  has_many :ownerships
  has_many :users, through: :ownerships

  has_many :borrow_receipts

  #the user attribute is the initial creator of the media_item
  attr_accessible :link, :title, :type, :user 

  validates_presence_of :type, :user, :title
  validates_uniqueness_of :title, :scope => [:type_id]

  def self.search(title)
  	search_condition = "%" + title + "%"
 	  find(:all, :conditions => ['lower(title) LIKE lower(?)', search_condition], :order => 'title')
  end
  
  def amount
    ownerships.size
  end

  def available
    ownerships.size - borrow_receipts.size
  end

end
