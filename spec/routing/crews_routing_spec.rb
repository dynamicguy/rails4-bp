require "spec_helper"

describe CrewsController do
  describe "routing" do

    it "routes to #index" do
      get("/crews").should route_to("crews#index")
    end

    it "routes to #new" do
      get("/crews/new").should route_to("crews#new")
    end

    it "routes to #show" do
      get("/crews/1").should route_to("crews#show", :id => "1")
    end

    it "routes to #edit" do
      get("/crews/1/edit").should route_to("crews#edit", :id => "1")
    end

    it "routes to #create" do
      post("/crews").should route_to("crews#create")
    end

    it "routes to #update" do
      put("/crews/1").should route_to("crews#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/crews/1").should route_to("crews#destroy", :id => "1")
    end

  end
end
