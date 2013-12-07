class Ownership < ActiveRecord::Base
  belongs_to :user
  belongs_to :media_item
  # attr_accessible :title, :body
end
