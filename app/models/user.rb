class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ownerships
  has_many :media_items, through: :ownerships

  validates_presence_of :name
  
  validates_uniqueness_of :email, :case_sensitive => false
end
