require 'spec_helper'

describe BorrowReceiptsController do

  describe "POST 'create'" do

    context "when the user is not signed in" do
    
      it "redirects to new_user_session_path" do
        post 'create'
        response.should redirect_to new_user_session_path
      end
    
    end
  end

end
