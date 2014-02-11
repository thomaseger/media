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

    context "when a term parameter is present" do
      context "when the term hits" do
        it "assigns the results" do 
          FactoryGirl.create_list(:media_item_with_type_and_user, 2)
          item = FactoryGirl.create(:media_item_search_hit)
          get 'index', :term => 'hit'
          expect(assigns(:media_items)).to eq([item])
        end
      end

      context "when the term doesn't hit" do
        it "does nothing" do
          FactoryGirl.create_list(:media_item_with_type_and_user, 2)
          item = FactoryGirl.create(:media_item_search_hit)
          get 'index', :term => 'no hit'
          expect(response.status).to eq 200
        end
      end
    end
  end

  describe "GET 'new'" do
    it "assigns media_item" do 
      get :new
      assigns(@media_item).should_not be_nil
    end

    it "assigns media_items" do
      get :new
      assigns(@media_items).should_not be_nil
    end
  end

  describe "GET 'show'" do
    it "assigns media_items" do
      item = FactoryGirl.create(:media_item_with_type_and_user) 
      get 'show', :id => item.id
      expect(assigns(:media_item)).to eq item
    end
  end

  describe "POST 'create'" do
    it "assigns media_items" do
      media_item_params = FactoryGirl.attributes_for(:media_item_with_type_and_user)
      post :create, :media_item => media_item_params
      assigns(@media_items).should_not be_nil
    end

    it "creates a new media item" do
      media_item_params = FactoryGirl.attributes_for(:media_item_with_type_and_user)
      expect { post :create, :media_item => media_item_params }.to change(MediaItem, :count).by(1)
    end
  end

end
