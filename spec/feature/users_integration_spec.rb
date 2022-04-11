# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Creating a user', type: :feature) do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user] # If using Devise
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
  it 'valid inputs for user' do
    visit root_path
    click_on 'Sign in with TAMU'
    visit new_user_path
    fill_in 'Studentid', with: 12_345_678
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    fill_in 'Dateofbirth', with: '2020-09-28'
    check 'user_isOfficer'
    click_on 'Create User'
    visit users_path
    expect(page).to(have_content('Jimbo Fisher'))
    expect(page).to(have_content('jf@tamu.edu'))
  end

  it 'edit profile' do
    visit root_path
    click_on 'Sign in with TAMU'
    visit new_user_path
    fill_in 'Studentid', with: 123
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    fill_in 'Dateofbirth', with: '2020-09-28'
    check 'user_isOfficer'
    click_on 'Create User'
    # visit user_path(123) #should show new user page
    visit edit_user_path(123)
    # click_on 'Edit Profile'
    fill_in 'Groupid', with: 143
    click_on 'Update User'
    expect(page).to(have_content('143'))
  end
end

RSpec.describe('Navigating from user page', type: :feature) do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user] # If using Devise
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]

  it 'to forum' do
    visit root_path
    click_on 'Sign in with TAMU'
    visit new_user_path
    fill_in 'Studentid', with: 123
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    fill_in 'Dateofbirth', with: '2020-09-28'
    click_on 'Create User'

    visit user_path(123)
    click_on 'Forum'

    expect(page).to(have_content('Add New Post'))
  end

  it 'users catalog to create new user' do
    visit root_path
    click_on 'Sign in with TAMU'
    visit new_user_path
    fill_in 'Studentid', with: 123
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    fill_in 'Dateofbirth', with: '2020-09-28'
    click_on 'Create User'

    visit users_path
    click_on 'New User'

    expect(page).to(have_content('New User'))
  end
end
