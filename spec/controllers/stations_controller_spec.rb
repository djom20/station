require 'spec_helper'

describe StationsController do
  context "when not signed in" do
    
    describe "#index" do 

      it "should redirect" do
        get :index, {}
        response.redirect?.should == true
      end
    end

    describe "#create" do
      it "should redirect" do
        post :create, {}
        response.redirect?.should == true
      end
    end

  end
  
  context "when signed in" do

    before do
      @user = FactoryGirl.create :user
      sign_in @user
    end

    describe "#index" do
      
      it "should not redirect" do
        get :index, {}
        response.redirect?.should == false
      end

      context "without stations" do
        it "should display empty" do
          get :index, {}
          assigns(:stations).count.should == 0
        end
      end

    end

    describe "#create" do
      
      before do
        @station = FactoryGirl.create(:gas_station)
      end

      it "should create it" do
        post :create, {:station => @station.attributes, :format => :json}
        JSON.parse(response.body)["name"] == @station.name
      end

      it "should not create it and then redirect" do
        @station.name = ''
        post :create, {:station => @station.attributes, :format => :json}
        
        JSON.parse(response.body)["name"] == ""
      end
    end

    
  end
end
