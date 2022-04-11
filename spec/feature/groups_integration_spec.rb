# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

Rails.application.env_config['devise.mapping'] = Devise.mappings[:user] # If using Devise
Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe('Creating a group', type: :feature) do
  it 'valid inputs' do
    visit root_path
    click_on 'Sign in with TAMU'

    User.create!(studentId: 1_234_567, isOfficer: true, isAdmin: false, fullName: 'Jimbo Fisher', avatarUrl: 'url', tamuEmail: 'jf@tamu.edu', dateOfBirth: '1965-10-09', gradAssistance: false)
    
    visit new_group_path
    select 'Jimbo Fisher', from: 'group_leaderInt'
    click_on 'Create Group'

    visit user_path(1_234_567)
    expect(page).to(have_content('Jimbo Fisher'))
  end

  it 'editing group - adding user' do
    visit root_path
    click_on 'Sign in with TAMU'

    User.create!(studentId: 1_234_567, isOfficer: true, isAdmin: false, fullName: 'Jimbo Fisher', avatarUrl: 'url', tamuEmail: 'jf@tamu.edu', dateOfBirth: '1965-10-09', gradAssistance: false)

    visit new_group_path
    fill_in 'Groupid', with: 123
    select 'Jimbo Fisher', from: 'group_leaderInt'
    click_on 'Create Group'

    User.create!(studentId: 111, isOfficer: false, isAdmin: false, fullName: 'stud', avatarUrl: 'url', tamuEmail: 'studa@tamu.edu', dateOfBirth: '2020-09-28', gradAssistance: false, groupId: -1)

    visit edit_group_path(123)
    select 'stud', from: 'group_user_id'
    click_on 'Update Group'

    visit group_path(123)
    expect(page).to(have_content('stud'))
  end

  it 'editing group - removing user' do
    visit root_path
    click_on 'Sign in with TAMU'

    User.create!(studentId: 1_234_567, isOfficer: true, isAdmin: false, fullName: 'Jimbo Fisher', avatarUrl: 'url', tamuEmail: 'jf@tamu.edu', dateOfBirth: '1965-10-09', gradAssistance: false)

    visit new_group_path
    fill_in 'Groupid', with: 123
    select 'Jimbo Fisher', from: 'group_leaderInt'
    click_on 'Create Group'

    User.create!(studentId: 111, isOfficer: false, isAdmin: false, fullName: 'stud', avatarUrl: 'url', tamuEmail: 'studa@tamu.edu', dateOfBirth: '2020-09-28', gradAssistance: false, groupId: 123)

    visit edit_group_path(123)
    select 'stud', from: 'group_remove_users'
    click_on 'Update Group'

    visit group_path(123)
    expect(page).not_to(have_content('stud'))
  end
end
