require 'spec_helper'

describe StatsController do
  

  describe "GET #expense" do

    describe "when there's activity" do

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


      it "should get not empty data" do
        get :expense, {:format => :json}
        data = JSON.parse(response.body)
        data.length.should == 4
      end

    end

    describe "when there's no activity" do
      it "it should fetch empty data" do
        get :expense, {:format => :json}
        data = JSON.parse(response.body)
        data.length.should == 1
      end

    end

  end

  describe "GET #gas_stations" do

    describe "when there's activity" do

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


      it "should get not empty data" do
        get :gas_stations, {:format => :json}
        data = JSON.parse(response.body)
        data.length.should == 4
      end

    end

    describe "when there's no activity" do
      it "it should fetch empty data" do
        get :gas_stations, {:format => :json}
        data = JSON.parse(response.body)
        data.length.should == 1
      end

    end

  end


end
