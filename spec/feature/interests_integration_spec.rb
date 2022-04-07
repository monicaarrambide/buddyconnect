# location: spec/feature/integration_spec.rb
require 'rails_helper'


Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe 'Creating a interest', type: :feature do
  scenario 'valid inputs' do
    
    visit root_path
    click_on 'Sign in with Google'
   
    visit new_user_path
    fill_in 'Studentid', with: 12345678
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    select '2020', :from => 'user_dateOfBirth_1i'
    select 'October', :from => 'user_dateOfBirth_2i'
    select '9', :from => 'user_dateOfBirth_3i'
    click_on 'Create User'

    visit new_interest_path
    fill_in 'Userid', with: 12345678
    fill_in 'Phone', with: '123456789'
    fill_in 'Nationality', with: 'Native American'
    select 'TX', :from => 'interest_state'
    select 'Park West', :from => 'interest_community'
    select 5, :from => 'interest_numPrereqs'
    select 'No', :from => 'interest_scholarship'
    fill_in 'Favemoviegenre', with: 'Action'
    fill_in 'Usedtech', with: 'Rails'
    select 1, :from => 'interest_numWorkExp'
    fill_in 'Projects', with: 'Canadian wombat photography'
    fill_in 'Extracurric', with: 'Photography'
    check 'potentialRoles_software'
    check 'pastWorkExp_softwareDev'

    click_on 'Create Interest'
    visit interests_path
    expect(page).to have_content(12345678)
    expect(page).to have_content('123456789')
    expect(page).to have_content('Native American')
    expect(page).to have_content('TX')
    expect(page).to have_content('Park West')
    expect(page).to have_content(5)
    expect(page).to have_content('No')
    expect(page).to have_content('Action')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('Rails')
    expect(page).to have_content(1)
    expect(page).to have_content('Canadian wombat photography')
    expect(page).to have_content('Photography')
    expect(page).to have_content('Software Development')
  end

  scenario 'edit interest' do
    visit root_path
    click_on 'Sign in with Google'

    visit new_user_path
    fill_in 'Studentid', with: 12345678
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    select '2020', :from => 'user_dateOfBirth_1i'
    select 'October', :from => 'user_dateOfBirth_2i'
    select '9', :from => 'user_dateOfBirth_3i'
    click_on 'Create User'

    visit new_interest_path
    fill_in 'Userid', with: 12345678
    fill_in 'Phone', with: '123456789'
    fill_in 'Nationality', with: 'Native American'
    select 'TX', :from => 'interest_state'
    select 'Park West', :from => 'interest_community'
    select 5, :from => 'interest_numPrereqs'
    select 'No', :from => 'interest_scholarship'
    fill_in 'Favemoviegenre', with: 'Action'
    fill_in 'Usedtech', with: 'Rails'
    select 1, :from => 'interest_numWorkExp'
    fill_in 'Projects', with: 'Canadian wombat photography'
    fill_in 'Extracurric', with: 'Photography'
    check 'potentialRoles_software'
    check 'pastWorkExp_softwareDev'

    click_on 'Create Interest'
    visit edit_interest_path(12345678)
    fill_in 'Userid', with: 12345678
    fill_in 'Nationality', with: 'German'
    click_on 'Update Interest'
    visit interests_path
    expect(page).to have_content("German")
  end
end

#:userId, :phone, :nationality, :state, :community, :numPrereqs, :scholarship, :faveMovieGenre, :numWorkExp, :usedTech, :projects, :extracurric, pastWorkExp:[], potentialRoles:[]