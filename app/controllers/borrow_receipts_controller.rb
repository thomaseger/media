class BorrowReceiptsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def borrow
    media_item = MediaItem.find(params[:media_item])
    borrow_to = User.find(params[:borrow_to].to_i) 

    if media_item.nil? && borrow_to.nil?
      media_item.borrowed_to = borrow_to.id

      if media_item.save
        flash[:notice] = "Okay, borrowed " + media_item.title + " to " + media_item.borrowed_to.name 
      else
        flash_technical_error
        logger.fatal media_item.errors.inspect
      end
    else
      flash_technical_error
      logger.fatal "media_item:  \n" + media_item.inspect
      logger.fatal "borrow_to: \n" + borrow_to.inspect
    end

    redirect_to action: 'index'
  end

private
  def flash_technical_error
    logger.fatal "Reported technical error to user."
    flash[:error] = "Sorry, something went wrong. This is a technical error which will be resolved immediatly."
  end
end
