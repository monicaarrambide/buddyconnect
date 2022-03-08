# require 'rails_helper'

# RSpec.describe "interests/edit", type: :view do
#   before(:each) do
#     @interest = assign(:interest, Interest.create!(
#       userId: 1,
#       phone: "MyString",
#       nationality: "MyString",
#       state: "MyString",
#       community: "MyString",
#       numPrereqs: 1,
#       scholarship: "MyString",
#       faveMovieGenre: "MyString",
#       potentialRoles: "MyString",
#       numWorkExp: 1,
#       usedTech: "MyString",
#       projects: "MyString",
#       extracurric: "MyString",
#       pastWorkExp: "MyString"
#     ))
#   end

#   it "renders the edit interest form" do
#     render

#     assert_select "form[action=?][method=?]", interest_path(@interest), "post" do

#       assert_select "input[name=?]", "interest[userId]"

#       assert_select "input[name=?]", "interest[phone]"

#       assert_select "input[name=?]", "interest[nationality]"

#       assert_select "input[name=?]", "interest[state]"

#       assert_select "input[name=?]", "interest[community]"

#       assert_select "input[name=?]", "interest[numPrereqs]"

#       assert_select "input[name=?]", "interest[scholarship]"

#       assert_select "input[name=?]", "interest[faveMovieGenre]"

#       assert_select "input[name=?]", "interest[potentialRoles][]"

#       assert_select "input[name=?]", "interest[numWorkExp]"

#       assert_select "input[name=?]", "interest[usedTech]"

#       assert_select "input[name=?]", "interest[projects]"

#       assert_select "input[name=?]", "interest[extracurric]"

#       assert_select "input[name=?]", "interest[pastWorkExp][]"
#     end
#   end
# end
