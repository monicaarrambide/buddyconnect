require "rails_helper"

RSpec.describe InterestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/interests").to route_to("interests#index")
    end

    it "routes to #new" do
      expect(get: "/interests/new").to route_to("interests#new")
    end

    it "routes to #show" do
      expect(get: "/interests/1").to route_to("interests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/interests/1/edit").to route_to("interests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/interests").to route_to("interests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/interests/1").to route_to("interests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/interests/1").to route_to("interests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/interests/1").to route_to("interests#destroy", id: "1")
    end
  end
end
