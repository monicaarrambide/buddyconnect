require "rails_helper"

RSpec.describe BiographiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/biographies").to route_to("biographies#index")
    end

    it "routes to #new" do
      expect(get: "/biographies/new").to route_to("biographies#new")
    end

    it "routes to #show" do
      expect(get: "/biographies/1").to route_to("biographies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/biographies/1/edit").to route_to("biographies#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/biographies").to route_to("biographies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/biographies/1").to route_to("biographies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/biographies/1").to route_to("biographies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/biographies/1").to route_to("biographies#destroy", id: "1")
    end
  end
end
