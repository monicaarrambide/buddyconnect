# location: spec/feature/integration_spec.rb
require 'rails_helper'


Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe 'Creating a interest', type: :feature do
  scenario 'valid inputs' do
    
    visit root_path
    click_on 'Sign in with Google'
    visit new_interest_path
    fill_in 'Interestsid', with: 12345678
    fill_in 'Userid', with: 123456789
    fill_in 'Careerinterest', with: 'few'
    fill_in 'Hobbies', with: 'many'
    fill_in 'Favmoviegenres', with: 'drama'
    fill_in 'Numberprereqs', with: 7
    fill_in 'Expectations', with: 'none'

    click_on 'Create Interest'
    visit interests_path
    expect(page).to have_content(12345678)
    expect(page).to have_content(123456789)
    expect(page).to have_content('few')
    expect(page).to have_content('many')
    expect(page).to have_content(7)
    expect(page).to have_content('none')
  end
end

#:interestsId, :userId, :careerInterest, :hobbies, :favMovieGenres, :numberPrereqs, :expectations