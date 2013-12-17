class Ownership < ActiveRecord::Base
  belongs_to :user
  belongs_to :media_item
  validates_presence_of :user, :media_item
end
