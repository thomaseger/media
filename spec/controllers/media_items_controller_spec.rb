require 'spec_helper'

describe MediaItemsController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'index'" do 

    it "renders the index view" do 
      post 'index'
      expect(response).to render_template :index
    end

    it "assigns all items" do 
      all = FactoryGirl.create_list(:media_item_with_type_and_user, 2)
      post 'index'
      expect(assigns(:media_items)).to eq(all)
    end

    context "no media available" do 
      it "flashes a not found notice" do 
        post 'index'
        flash[:notice].should include "yet"
      end
    end

    context "when a search parameter is present" do 
      context "when the search has hits" do 
        it "assigns the results" do 
          FactoryGirl.create_list(:media_item_with_type_and_user, 2)
          item = FactoryGirl.create(:media_item_search_hit)
          post 'index', :search => 'hit'
          expect(assigns(:media_items)).to eq([item])
        end
      end

      context "when the search has no hits" do 
        it "flashes a not found notice" do 
          FactoryGirl.create_list(:media_item_with_type_and_user, 2)
          item = FactoryGirl.create(:media_item_search_hit)
          post 'index', :search => 'no hit'
          flash[:notice].should include "No media"
        end
      end
    end
  end

  describe "GET 'new'" do
    pending
  end

  describe "GET 'show'" do
    pending
  end

  describe "POST 'create'" do
    pending
  end

end
