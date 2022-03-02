# location: spec/feature/integration_spec.rb
require 'rails_helper'

Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe 'Creating a group', type: :feature do
  scenario 'valid inputs' do
    
    visit root_path
    click_on 'Sign in with Google'
    visit new_group_path
    fill_in 'Groupid', with: 12345678
    fill_in 'Leaderint', with: 123456789


    click_on 'Create Group'
    visit groups_path
    expect(page).to have_content(12345678)
    expect(page).to have_content(123456789)
  end
end
