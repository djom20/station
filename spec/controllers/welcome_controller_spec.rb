require 'spec_helper'

describe WelcomeController do
  context "when not signed in" do
    
    describe "#index" do 

      it "should redirect" do
        get :index, {}
        response.redirect?.should == false
      end
    end

  end
end
