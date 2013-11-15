class MediaItemsController < ApplicationController

  	before_filter :authenticate_user!

	def index
		@media_items = MediaItem.all
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

	def search
		@media_items = MediaItem.search params[:search]
	end
end
