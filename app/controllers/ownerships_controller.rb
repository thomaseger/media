class OwnershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    user = User.find(params[:ownership][:user].to_i)
    item = MediaItem.find(params[:ownership][:media_item].to_i)
    ownership = Ownership.create(:user => user, :media_item => item)

    if ownership.save
      redirect_to_library
    else
      redirect_to :controller => :media_item, :action => :new
    end
  end

  def destroy
    @ownership = Ownership.find(params[:id])
    flash[:notice] = "Removed one #{@ownership.media_item.title} from library."

    @ownership.destroy
    redirect_to_library
  end

  private
    def redirect_to_library
      redirect_to :controller => :library, :action => :index
    end
end

