require "rails_helper"

RSpec.describe BartersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/barters").to route_to("barters#index")
    end

    it "routes to #new" do
      expect(:get => "/barters/new").to route_to("barters#new")
    end

    it "routes to #show" do
      expect(:get => "/barters/1").to route_to("barters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/barters/1/edit").to route_to("barters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/barters").to route_to("barters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/barters/1").to route_to("barters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/barters/1").to route_to("barters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/barters/1").to route_to("barters#destroy", :id => "1")
    end

  end
end
