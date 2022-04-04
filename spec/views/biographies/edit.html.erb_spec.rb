require 'rails_helper'

RSpec.describe "biographies/edit", type: :view do
  before(:each) do
    @biography = assign(:biography, Biography.create!(
      userId: "MyString",
      description: "MyString"
    ))
  end

  it "renders the edit biography form" do
    render

    assert_select "form[action=?][method=?]", biography_path(@biography), "post" do

      assert_select "input[name=?]", "biography[userId]"

      assert_select "input[name=?]", "biography[description]"
    end
  end
end
