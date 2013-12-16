class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ownerships
  has_many :media_items, through: :ownerships

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates_presence_of :name
  
  validates_uniqueness_of :email, :case_sensitive => false
end
