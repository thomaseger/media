class MediaItem < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	
  belongs_to :type
  belongs_to :user

  attr_accessible :link, :title, :type, :user, :borrowed_to

  validates_presence_of :type, :user, :title

  validates_uniqueness_of :title

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

private
  def receipt
    BorrowReceipt.where(:media_item_id => id).limit(1).first
  end
end
