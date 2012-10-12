require 'spec_helper'

describe TankingController do
  
  before do
    @user = FactoryGirl.create(:user)
    @car = FactoryGirl.create(:car, user: @user)
    @gas_station = FactoryGirl.create(:gas_station)
  end

  context "when not signed in" do
    
    describe "#index" do 

      it "should redirect" do
        get :index, {:car_id => @car.slug}
        response.redirect?.should == true
      end
    end

    describe "#show" do
      it "should redirect" do
        get :show, {:car_id => @car.slug, :id => "1"}
        response.redirect?.should == true
      end
    end


    describe "#new" do
      it "should redirect" do
        get :new, {:car_id => @car.slug}
        response.redirect?.should == true
      end
    end

    describe "#create" do
      it "should redirect" do
        post :create, {:car_id => @car.slug}
        response.redirect?.should == true
      end
    end
 
  end
  
  context "when signed in" do

    before do
      sign_in @user
    end

    describe "#index" do
      
      it "should not redirect" do
        get :index, {:car_id => @car.slug}
        response.redirect?.should == false
      end

      context "without cars" do
        it "should display empty" do
          get :index, {:car_id => @car.slug}
          assigns(:tanking_logs).count.should == 0
        end
      end

    end

    describe "#show" do
      it "should not redirect" do
        get :show, {:car_id => "", :id => "slug"}
        response.redirect?.should == false
      end

      it "should display the tanking_log" do
         get :show, {:car_id => @car.slug, :id => "slug"}
         
      end
    end


    describe "#new" do
      it "should not redirect" do
        get :new, {:car_id => @car.slug}
        response.redirect?.should == false
      end

      it "should not redirect" do
        get :new, {:car_id => @car.slug}
        
      end
    end

    describe "#create" do
      
      before do
        @tanking_log = FactoryGirl.create(:tanking_log, car: @car, gas_station: @gas_station)
      end

      it "should create it" do
        post :create, {:car_id => @car.slug, :tanking_log => @tanking_log.attributes}
        response.should redirect_to dashboard_url
      end

      it "should not create it and then redirect" do
        @tanking_log.gas_station = nil
        post :create, {:car_id => "", :tanking_log => @tanking_log.attributes}
        response.should redirect_to dashboard_url
      end
    end

  end
end
