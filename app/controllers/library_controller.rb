class LibraryController < ApplicationController

  before_filter :authenticate_user!

  def index
    @media_items = current_user.media_items.order(:title).uniq
  end
  
end
