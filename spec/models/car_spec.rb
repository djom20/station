require 'spec_helper'

describe Car do

  before (:each) do
    @user = FactoryGirl.create(:user)
    @car = FactoryGirl.create(:car, user: @user)
  end

  describe "Validations" do

    it "should have brand" do
      @car.brand = ''
      @car.valid?.should be_false
    end

    it "should have user" do
      @car.user = nil
      @car.valid?.should be_false
    end

    it "should have model" do
      @car.model = ''
      @car.valid?.should be_false
    end

    it "should have year" do
      @car.year = ''
      @car.valid?.should be_false
    end

    it "should have color" do
      @car.color = ''
      @car.valid?.should be_false
    end

  end

  describe "Class methods" do
    
    describe "Car#by_slug" do

      it "should find a car by slug" do
        Car.by_slug(@car.slug).should == @car
      end

    end

  end

  describe "Instance methods" do
    describe "Car#to_param" do
      it "should return the slug" do        
        @car.to_param.should == @car.slug
      end
    end

    describe "Car#to_param" do
      before do
        @gas_station = FactoryGirl.create(:gas_station)
        @refueling_list = []
        3.times do |t|
          @refueling_list << FactoryGirl.create(:tanking_log, car: @car, gas_station: @gas_station)
        end
      end

      it "should return the refueling cost" do
        cost = 0
        @refueling_list.each do |refueling|
          cost+=refueling.cost.to_f
        end

        @car.refueling_cost.should == cost

      end
    end

  end

  
    
  

end
