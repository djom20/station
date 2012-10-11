
require 'spec_helper'

describe CarsController do

  context "when not signed in" do
    
    describe "#index" do 

      it "should redirect" do
        get :index, {}
        response.redirect?.should == true
      end
    end

    describe "#show" do
      it "should redirect" do
        get :show, {:id => "slug"}
        response.redirect?.should == true
      end
    end


    describe "#new" do
      it "should redirect" do
        get :new, {}
        response.redirect?.should == true
      end
    end

    describe "#create" do
      it "should redirect" do
        post :create, {}
        response.redirect?.should == true
      end
    end

    describe "#edit" do
      it "should redirect" do
        get :edit, {:id => 'slug'}
        response.redirect?.should == true
      end
    end

    describe "#update" do
      it "should redirect" do
        put :update, {:id => 'slug'}
        response.redirect?.should == true
      end
    end

    describe "#destroy" do
      it "should redirect" do
        delete :destroy, {:id => 'slug'}
        response.redirect?.should == true
      end
    end

    describe "#preview" do
      it "should redirect" do
        get :preview, {:car_id => "slug"}
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

      context "without cars" do
        it "should display empty" do
          get :index, {}
          assigns(:cars).count.should == 0
        end
      end

      context "with several cars" do
      end
    end

    describe "#show" do
      it "should not redirect" do
        get :show, {:id => "slug"}
        response.redirect?.should == false
      end

      it "should display the car" do
         get :show, {:id => "slug"}
      end
    end


    describe "#new" do
      it "should not redirect" do
        get :new, {}
        response.redirect?.should == false
      end

      it "should not redirect" do
        get :new, {}
        
      end
    end

    describe "#create" do
      
      before do
        @car = FactoryGirl.create(:car, user: @user)
      end

      it "should create it" do
        post :create, {:car => @car.attributes}
        response.should redirect_to dashboard_url
      end

      it "should not create it and then redirect" do
        @car.brand = 'marca acme'
        post :create, {:car => @car.attributes}
        response.should redirect_to new_car_url
      end
    end

    describe "#edit" do
      it "should not redirect" do
        get :edit, {:id => "slug"}
        response.redirect?.should == false
      end

      it "" do
        get :edit, {:id => 'slug'}
        
      end
    end

    describe "#update" do
      it "" do
        put :update, {:id => 'slug'}
        
      end
    end

    describe "#destroy" do
      it "" do
        delete :destroy, {:id => 'slug'}
        
      end
    end

    describe "#preview" do
      
      it "should not redirect" do
        get :preview, {:car_id => "slug"}
        response.redirect?.should == false
      end

      it "" do
        get :preview, {:car_id => "slug"}
        
      end
    end
  end

end
