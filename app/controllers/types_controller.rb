class TypesController < ApplicationController
  
  before_filter :authenticate_user!

  def index
  	@types = Type.order("name ASC")
  end

  def new 
  	@type = Type.new
  end

  def create
		@type = Type.new(params[:type].permit(:name))

		if @type.save
			redirect_to action: 'index'
		else
			render 'new'
		end
	end
end
