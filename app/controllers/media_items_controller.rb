class MediaItemsController < ApplicationController

  before_filter :authenticate_user!

	def index

    flash.clear

    if params.has_key?(:search)
    	@media_items = MediaItem.search params[:search]
    elsif params.has_key?(:term)
      @media_items = MediaItem.search params[:term]
    else
      @media_items = MediaItem.order('title')
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

    respond_to do |format|
      format.html 
      format.json { render :json => @media_items }
    end
	end

	def new
		@media_item = MediaItem.new
    @media_items = MediaItem.order(:title)
	end

	def show
		@media_item = MediaItem.find(params[:id])
	end

	def create
    @media_items = MediaItem.all

    @media_item = MediaItem.create(params[:media_item].permit(:title, :link))
    @media_item.type = Type.find(params[:media_item][:type])
    @media_item.user = current_user
    current_user.ownerships.create(:media_item => @media_item)

		if @media_item.save
			redirect_to @media_item
		else
			render :new
		end
	end
end
