# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a interest', type: :feature do
  scenario 'valid inputs' do
    visit new_interest_path
    fill_in 'Interestsid', with: 12345678
    fill_in 'Userid', with: 12345678
    fill_in 'Careerinterest', with: 'Few'
    fill_in 'Hobbies', with: 'Many'
    fill_in 'Favmoviegenres', with: 'Drama'
    fill_in 'Numberprereqs', with: 7
    fill_in 'Expectations', with: 'A lot'

    click_on 'Create Interest'
    visit interests_path
    expect(page).to have_content(12345678)
  end
end

#:interestsId, :userId, :careerInterest, :hobbies, :favMovieGenres, :numberPrereqs, :expectations