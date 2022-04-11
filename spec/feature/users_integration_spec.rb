require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
    
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]
    scenario 'valid inputs for user' do
        
        visit root_path
        click_on 'Sign in with Google'
        visit new_user_path
        fill_in 'Fullname', with: 'Jimbo Fisher'
        fill_in 'Tamuemail', with: 'jf@tamu.edu'
        select '2020', :from => 'user_dateOfBirth_1i'
        select 'October', :from => 'user_dateOfBirth_2i'
        select '9', :from => 'user_dateOfBirth_3i'
        click_on 'Create User'
        visit users_path
        expect(page).to have_content('Jimbo Fisher')
        expect(page).to have_content('jf@tamu.edu')
    end

    scenario 'edit profile' do
        visit root_path
        click_on 'Sign in with Google'
        visit new_user_path
        fill_in 'Fullname', with: 'Jimbo Fisher'
        fill_in 'Tamuemail', with: 'jf@tamu.edu'
        select '2020', :from => 'user_dateOfBirth_1i'
        select 'October', :from => 'user_dateOfBirth_2i'
        select '9', :from => 'user_dateOfBirth_3i'
        click_on 'Create User'
        #visit user_path(123) #should show new user page
        click_on 'Edit Profile'
        # visit edit_user_path(123)
        #click_on 'Edit Profile'
        fill_in 'Groupid', with: 143
        click_on 'Update User'
        expect(page).to have_content('143')
    end
end

RSpec.describe 'Navigating from user page', type: :feature do
    
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]
    
    scenario 'to forum' do
        visit root_path
        click_on 'Sign in with Google'
        visit new_user_path
        fill_in 'Fullname', with: 'Jimbo Fisher'
        fill_in 'Tamuemail', with: 'jf@tamu.edu'
        select '2020', :from => 'user_dateOfBirth_1i'
        select 'October', :from => 'user_dateOfBirth_2i'
        select '9', :from => 'user_dateOfBirth_3i'
        click_on 'Create User'

        # visit user_path(123)
        click_on 'Forum'

        expect(page).to have_content('Add New Post')
    end

    scenario 'users catalog to create new user' do
        visit root_path
        click_on 'Sign in with Google'
        visit new_user_path
        fill_in 'Fullname', with: 'Jimbo Fisher'
        fill_in 'Tamuemail', with: 'jf@tamu.edu'
        select '2020', :from => 'user_dateOfBirth_1i'
        select 'October', :from => 'user_dateOfBirth_2i'
        select '9', :from => 'user_dateOfBirth_3i'
        click_on 'Create User'

        visit users_path
        click_on 'New User'

        expect(page).to have_content('New User')
    end
end
