# location: spec/feature/integration_spec.rb
require 'rails_helper'

Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe 'Creating a group', type: :feature do
  scenario 'valid inputs' do
    
    visit root_path
    click_on 'Sign in with Google'
    visit new_user_path
    fill_in 'Studentid', with: 1234567
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    check 'user_isOfficer'
    fill_in 'Dateofbirth', with: '2020-09-28'
    click_on 'Create User'

    visit new_group_path
    fill_in 'Groupid', with: 12345678
    select 'Jimbo Fisher', :from => 'group_leaderInt'

    click_on 'Create Group'
    visit groups_path
    expect(page).to have_content(12345678)
    expect(page).to have_content('Jimbo Fisher')
  end

  scenario 'editing group - adding user' do

    visit root_path
    click_on 'Sign in with Google'

    visit new_user_path
    fill_in 'Studentid', with: 1234567
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    fill_in 'Groupid', with: 123
    check 'user_isOfficer'
    fill_in 'Dateofbirth', with: '2020-09-28'
    click_on 'Create User'
    
    visit new_group_path
    fill_in 'Groupid', with: 123
    select 'Jimbo Fisher', :from => 'group_leaderInt'
    click_on 'Create Group'

    visit new_user_path
    fill_in 'Studentid', with: 8
    fill_in 'Fullname', with: 'stud'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'studa@tamu.edu'
    fill_in 'Groupid', with: 567
    fill_in 'Dateofbirth', with: '2020-09-28'
    click_on 'Create User'
    
    visit edit_group_path(123)
    select 'stud', :from => 'group_user_id'
    click_on 'Update Group'

    visit group_path(123)
    expect(page).to have_content('stud')
  end

  scenario 'editing group - removing user' do

    visit root_path
    click_on 'Sign in with Google'

    visit new_user_path
    fill_in 'Studentid', with: 12345678
    fill_in 'Fullname', with: 'Jimbo Fisher'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'jf@tamu.edu'
    fill_in 'Groupid', with: 123
    check 'user_isOfficer'
    fill_in 'Dateofbirth', with: '2020-09-28'
    click_on 'Create User'
    
    visit new_group_path
    fill_in 'Groupid', with: 123
    select 'Jimbo Fisher', :from => 'group_leaderInt'
    click_on 'Create Group'

    visit new_user_path
    fill_in 'Studentid', with: 8
    fill_in 'Fullname', with: 'stud'
    fill_in 'Avatarurl', with: 'url'
    fill_in 'Tamuemail', with: 'studa@tamu.edu'
    fill_in 'Groupid', with: 123
    fill_in 'Dateofbirth', with: '2020-09-28'
    click_on 'Create User'
    
    visit edit_group_path(123)
    select 'stud', :from => 'group_remove_users'
    click_on 'Update Group'

    visit group_path(123)
    expect(page).not_to have_content('stud')
  end
end
