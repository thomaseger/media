class MediaItem < ActiveRecord::Base
	
  belongs_to :type
  belongs_to :user

  has_many :ownerships
  has_many :users, through: :ownerships

  has_many :borrow_receipts

  validates_presence_of :type, :user, :title
  validates_uniqueness_of :title, :scope => [:type_id]

  def self.search(title)
  	search_condition = "%" + title + "%"
    where('lower(title) LIKE lower(?)', search_condition).order('title')
  end
  
  def amount
    ownerships.size
  end

  def available
    ownerships.size - borrow_receipts.size
  end

  def image
    if image_url.nil?
      return "no.png" 
    end
    return image_url
  end

  def as_json(options={})
    hash = super(options)
    hash.merge!("type_name" => type.name)
  end
end
