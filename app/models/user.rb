class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :media_items

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
end
