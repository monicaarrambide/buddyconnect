# frozen_string_literal: true

require 'rails_helper'

Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe 'Creating a user', type: :feature do
    
    scenario 'valid inputs for user' do
        
        visit root_path
        click_on 'Sign in with TAMU'

        User.find_by(tamuEmail: "JaneDoe@tamu.edu").update!(isAdmin: true)

        visit new_user_path
        fill_in 'Fullname', with: 'Jimbo Fisher'
        fill_in 'Tamuemail', with: 'jf@tamu.edu'
        fill_in 'Dateofbirth', with: '2020-09-28'
        click_on 'Create User'

        visit users_path
        expect(page).to have_content('Jimbo Fisher')
        expect(page).to have_content('jf@tamu.edu')
    end

    scenario 'edit profile' do
        visit root_path
        click_on 'Sign in with TAMU'

        click_on 'Edit Profile'
        fill_in 'Fullname', with: "Harrison Ford"
        click_on 'Update User'
        expect(page).to have_content('Harrison Ford')
    end
end

RSpec.describe 'Navigating from user page', type: :feature do
    
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]
    
    scenario 'to forum' do
        visit root_path
        click_on 'Sign in with TAMU'
        visit new_user_path
        fill_in 'Fullname', with: 'Jimbo Fisher'
        fill_in 'Tamuemail', with: 'jf@tamu.edu'
        fill_in 'Dateofbirth', with: '2020-09-28'
        click_on 'Create User'

        # visit user_path(123)
        click_on 'Forum'

    expect(page).to(have_content('Add New Post'))
  end

    scenario 'users catalog to create new user' do
        visit root_path
        click_on 'Sign in with TAMU'
        visit new_user_path
        fill_in 'Fullname', with: 'Jimbo Fisher'
        fill_in 'Tamuemail', with: 'jf@tamu.edu'
        fill_in 'Dateofbirth', with: '2020-09-28'
        click_on 'Create User'

    visit users_path
    click_on 'New User'

    expect(page).to(have_content('New User'))
  end
end
