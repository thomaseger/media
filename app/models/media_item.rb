class MediaItem < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	
  belongs_to :type
  belongs_to :user

  has_many :ownerships
  has_many :users, through: :ownerships

  #the user attribute is the initial creator of the media_item
  attr_accessible :link, :title, :type, :user 

  validates_presence_of :type, :user, :title
  validates_uniqueness_of :title, :scope => [:type_id]

  def self.search(title)
  	search_condition = "%" + title + "%"
 	  find(:all, :conditions => ['lower(title) LIKE lower(?)', search_condition], :order => 'title')
  end
  
  def borrowed?
    !receipt.nil?
  end

  def borrower_name
  	if receipt.nil?
      "nobody"
    else
      User.find(receipt.borrower_id).name
    end
  end 

  def count
    ownerships.size
  end

private
  def receipt
    BorrowReceipt.where(:media_item_id => id).limit(1).first
  end
end
