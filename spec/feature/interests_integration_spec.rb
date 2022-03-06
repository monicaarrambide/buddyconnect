# location: spec/feature/integration_spec.rb
require 'rails_helper'



RSpec.describe 'Creating a interest', type: :feature do
  scenario 'valid inputs' do
    visit new_interest_path
    fill_in 'Userid', with: 12345678
    fill_in 'Phone', with: 123456789
    fill_in 'Nationality', with: 'Native American'
    fill_in 'State', with: 'Texas'
    fill_in 'Community', with: 'Rise'
    fill_in 'Numprereqs', with: 7
    fill_in 'Scholarship', with: 'none'
    fill_in 'Favemoviegenre', with: 'Action'
    fill_in 'Potentialroles', with: 'leader'
    fill_in 'Usedtech', with: 'Rails'
    fill_in 'Numworkexp', with: 1
    fill_in 'Projects', with: 'Canadian wombat photography'
    fill_in 'Extracurric', with: 'Photography'
    fill_in 'Pastworkexp', with: 'Amazon'

    click_on 'Create Interest'
    visit interests_path
    expect(page).to have_content(12345678)
    expect(page).to have_content(123456789)
    expect(page).to have_content('Native American')
    expect(page).to have_content('Texas')
    expect(page).to have_content(7)
    expect(page).to have_content('Rise')
    expect(page).to have_content('Action')
    expect(page).to have_content('leader')
    expect(page).to have_content('Rails')
    expect(page).to have_content(1)
    expect(page).to have_content('Canadian wombat photography')
    expect(page).to have_content('Photography')
    expect(page).to have_content('Amazon')
  end
end

#:interestsId, :userId, :careerInterest, :hobbies, :favMovieGenres, :numberPrereqs, :expectations