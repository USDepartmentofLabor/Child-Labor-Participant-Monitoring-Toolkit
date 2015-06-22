require "rails_helper"

RSpec.describe HouseholdsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/households").to route_to("households#index")
    end

    it "routes to #new" do
      expect(:get => "/households/new").to route_to("households#new")
    end

    it "routes to #show" do
      expect(:get => "/households/1").to route_to("households#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/households/1/edit").to route_to("households#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/households").to route_to("households#create")
    end

    it "routes to #update" do
      expect(:put => "/households/1").to route_to("households#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/households/1").to route_to("households#destroy", :id => "1")
    end

  end
end
