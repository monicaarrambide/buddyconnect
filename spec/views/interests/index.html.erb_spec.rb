require 'rails_helper'

RSpec.describe "interests/index", type: :view do
  # before(:each) do
  #   assign(:interests, [
  #     Interest.create!(
  #       userId: 2,
  #       phone: "Phone",
  #       nationality: "Nationality",
  #       state: "State",
  #       community: "Community",
  #       numPrereqs: 3,
  #       scholarship: "Scholarship",
  #       faveMovieGenre: "Fave Movie Genre",
  #       potentialRoles: "Potential Roles",
  #       numWorkExp: 4,
  #       usedTech: "Used Tech",
  #       projects: "Projects",
  #       extracurric: "Extracurric",
  #       pastWorkExp: "Past Work Exp"
  #     ),
  #     Interest.create!(
  #       userId: 2,
  #       phone: "Phone",
  #       nationality: "Nationality",
  #       state: "State",
  #       community: "Community",
  #       numPrereqs: 3,
  #       scholarship: "Scholarship",
  #       faveMovieGenre: "Fave Movie Genre",
  #       potentialRoles: "Potential Roles",
  #       numWorkExp: 4,
  #       usedTech: "Used Tech",
  #       projects: "Projects",
  #       extracurric: "Extracurric",
  #       pastWorkExp: "Past Work Exp"
  #     )
  #   ])
  # end

  # it "renders a list of interests" do
  #   render
  #   assert_select "tr>td", text: 2.to_s, count: 2
  #   assert_select "tr>td", text: "Phone".to_s, count: 2
  #   assert_select "tr>td", text: "Nationality".to_s, count: 2
  #   assert_select "tr>td", text: "State".to_s, count: 2
  #   assert_select "tr>td", text: "Community".to_s, count: 2
  #   assert_select "tr>td", text: 3.to_s, count: 2
  #   assert_select "tr>td", text: "Scholarship".to_s, count: 2
  #   assert_select "tr>td", text: "Fave Movie Genre".to_s, count: 2
  #   assert_select "tr>td", text: "Potential Roles".to_s, count: 2
  #   assert_select "tr>td", text: 4.to_s, count: 2
  #   assert_select "tr>td", text: "Used Tech".to_s, count: 2
  #   assert_select "tr>td", text: "Projects".to_s, count: 2
  #   assert_select "tr>td", text: "Extracurric".to_s, count: 2
  #   assert_select "tr>td", text: "Past Work Exp".to_s, count: 2
  # end
end
