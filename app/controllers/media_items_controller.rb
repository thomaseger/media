class MediaItemsController < ApplicationController

  	before_filter :authenticate_user!

	def index

    flash.clear

    if params.has_key?(:search)
    	@media_items = MediaItem.search params[:search]
    else
      @media_items = MediaItem.all
    end

    if @media_items.empty?
      notice = "Sorry! No media available"

      if params.has_key?(:search) 
        notice += " containing your search (" + params[:search] + ")."
      else
        notice += ", yet."
      end

      flash[:notice] = notice
    end
	end

	def new
		@media_item = MediaItem.new
	end

	def show
		@media_item = MediaItem.find(params[:id])
	end

	def create
		@media_item = current_user.media_items.create(params[:media_item].permit(:title, :link))
		@media_item.type = Type.find(params[:media_item][:type])

		if @media_item.save
			redirect_to @media_item
		else
			render 'new'
		end
	end
end
