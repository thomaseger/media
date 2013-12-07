class Ownership < ActiveRecord::Base
  belongs_to :user
  belongs_to :media_item
  attr_accessible :user, :media_item
end
