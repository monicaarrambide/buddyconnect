# location: spec/feature/integration_spec.rb
require 'rails_helper'

Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe 'Creating a biography', type: :feature do
  scenario 'valid inputs' do
    
    visit root_path
    click_on 'Sign in with Google'
    
    visit '/biographies/new'
    fill_in 'Userid', with: "12345678"
    fill_in 'Description', with: "Pizza"
    click_on 'Create Biography'
    visit biographies_path
    expect(page).to have_content(12345678)
    expect(page).to have_content("Pizza")

  end


  scenario 'invalid inputs for Userid' do
    visit root_path
    click_on 'Sign in with Google'
    visit '/biographies/new'
    fill_in 'Description', with: "Pizza"
    click_on 'Create Biography'
    expect(page).to have_content("Userid can't be blank")
  end

  scenario 'invalid inputs for description' do
    visit root_path
    click_on 'Sign in with Google'
    visit '/biographies/new'
    fill_in 'Userid', with: "12345678"
    click_on 'Create Biography'
    expect(page).to have_content("Description can't be blank")
  end

end