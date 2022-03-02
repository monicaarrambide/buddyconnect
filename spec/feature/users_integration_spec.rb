require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
    
Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]
    scenario 'valid inputs for user' do
        
        visit root_path
        click_on 'Sign in with Google'
        visit new_user_path
        fill_in 'Studentid', with: 12345678
        fill_in 'Firstname', with: 'Jimbo'
        fill_in 'Lastname', with: 'Fisher'
        fill_in 'Tamuemail', with: 'jf@tamu.edu'
        select '2020', :from => 'user_dateOfBirth_1i'
        select 'October', :from => 'user_dateOfBirth_2i'
        select '9', :from => 'user_dateOfBirth_3i'
        # fill_in 'Dateofbirth', with: '1965-10-09'
        click_on 'Create User'
        visit users_path
        expect(page).to have_content('12345678')
        expect(page).to have_content('Jimbo')
        expect(page).to have_content('Fisher')
        expect(page).to have_content('jf@tamu.edu')
        expect(page).to have_content('2020-10-09')
    end
end