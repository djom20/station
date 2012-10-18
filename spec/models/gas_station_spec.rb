require 'spec_helper'

describe GasStation do

  describe "Class methods" do
    describe "GasStation#expensivest" do
      context "No refueling activity" do
        it "should return nil" do
          expensivest = GasStation.expensivest
          expensivest.should == nil
        end
      end

      context "with some refueling activity" do
        before do
          @user = FactoryGirl.create(:user)
          stations = []
          cars = [] 
          refueling_logs = []

          3.times do |t|
            stations << FactoryGirl.create(:gas_station)
          end

          3.times do |t|
            cars << FactoryGirl.create(:car, user: @user)
          end

          4.times do |t|
            refueling_logs << FactoryGirl.create(:tanking_log, gas_station: stations.sample, car: cars.sample)
          end
        end

        it "should return not nil" do
          expensivest = GasStation.expensivest
          expensivest.should_not == nil
        end
      end

    end
  end

  describe "GasStation#most_yield" do
    context "No refueling activity" do
      it "should return nil" do
        most_yield= GasStation.most_yield
        most_yield.should == nil
      end
    end

    context "with some refueling activity" do
      before do
        @user = FactoryGirl.create(:user)
        stations = []
        cars = [] 
        refueling_logs = []

        3.times do |t|
          stations << FactoryGirl.create(:gas_station)
        end

        3.times do |t|
          cars << FactoryGirl.create(:car, user: @user)
        end

        4.times do |t|
          refueling_logs << FactoryGirl.create(:tanking_log, gas_station: stations.sample, car: cars.sample)
        end
      end

      it "should return not nil" do
        most_yield = GasStation.most_yield
        most_yield.should_not == nil
      end
    end

  end
end
