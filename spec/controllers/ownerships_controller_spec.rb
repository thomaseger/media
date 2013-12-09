require 'spec_helper'

describe OwnershipsController do

  describe "POST 'create'" do

    context "the user is not signed in" do
    
      it "when redirects to new_user_session_path" do
        post 'create'
        response.should redirect_to new_user_session_path
      end

    end

  end

end
