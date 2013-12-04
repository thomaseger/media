class LibraryController < ApplicationController

  before_filter :authenticate_user!

  def index
    @media_items = MediaItem.where(:user_id => current_user)
  end
  
end
