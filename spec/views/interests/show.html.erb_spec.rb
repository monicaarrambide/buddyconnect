require 'rails_helper'

RSpec.describe "interests/show", type: :view do
  before(:each) do
    @interest = assign(:interest, Interest.create!(
      userId: 2,
      phone: "Phone",
      nationality: "Nationality",
      state: "State",
      community: "Community",
      numPrereqs: 3,
      scholarship: "Scholarship",
      faveMovieGenre: "Fave Movie Genre",
      potentialRoles: "Potential Roles",
      numWorkExp: 4,
      usedTech: "Used Tech",
      projects: "Projects",
      extracurric: "Extracurric",
      pastWorkExp: "Past Work Exp"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Nationality/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Community/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Scholarship/)
    expect(rendered).to match(/Fave Movie Genre/)
    expect(rendered).to match(/Potential Roles/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Used Tech/)
    expect(rendered).to match(/Projects/)
    expect(rendered).to match(/Extracurric/)
    expect(rendered).to match(/Past Work Exp/)
  end
end
