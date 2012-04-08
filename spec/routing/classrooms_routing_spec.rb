require "spec_helper"

describe ClassroomsController do
  describe "routing" do

    it "routes to #index" do
      get("/classrooms").should route_to("classrooms#index")
    end

    it "routes to #new" do
      get("/classrooms/new").should route_to("classrooms#new")
    end

    it "routes to #show" do
      get("/classrooms/1").should route_to("classrooms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/classrooms/1/edit").should route_to("classrooms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/classrooms").should route_to("classrooms#create")
    end

    it "routes to #update" do
      put("/classrooms/1").should route_to("classrooms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/classrooms/1").should route_to("classrooms#destroy", :id => "1")
    end

  end
end
