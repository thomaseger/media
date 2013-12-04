class BorrowReceiptsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @borrow_receipt = BorrowReceipt.new
    @borrow_receipt.media_item_id = params[:media_item]
  end

  def create
    @borrow_receipt = BorrowReceipt.create(params[:borrow_receipt].permit(:borrower_id, :media_item_id, :owner_id))
    if @borrow_receipt.save
      flash[:notice] = "You borrowed " + MediaItem.find(@borrow_receipt.media_item_id).title + " to " + User.find(@borrow_receipt.borrower_id).name + " successfully."
      redirect_to :controller => 'library', :action => 'index'
    else
      render 'new'
    end
  end

  def index
  end

private
  def flash_technical_error
    logger.fatal "Reported technical error to user."
    flash[:error] = "Sorry, something went wrong. This is a technical error which will be resolved immediatly."
  end
end
