class OwnershipsController < ApplicationController
  def create
    user = User.find(params[:ownership][:user].to_i)
    item = MediaItem.find(params[:ownership][:media_item].to_i)
    ownership = Ownership.create(:user => user, :media_item => item)

    if ownership.save
      redirect_to :controller => :library, :action => :index
    else
      redirect_to :controller => :media_item, :action => :new
    end
  end
end

