require "rails_helper"

RSpec.describe IndicatorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/indicators").to route_to("indicators#index")
    end

    it "routes to #new" do
      expect(:get => "/indicators/new").to route_to("indicators#new")
    end

    it "routes to #show" do
      expect(:get => "/indicators/1").to route_to("indicators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/indicators/1/edit").to route_to("indicators#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/indicators").to route_to("indicators#create")
    end

    it "routes to #update" do
      expect(:put => "/indicators/1").to route_to("indicators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/indicators/1").to route_to("indicators#destroy", :id => "1")
    end

  end
end
