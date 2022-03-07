# location: spec/feature/integration_spec.rb
require 'rails_helper'

Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe 'Creating a comment', type: :feature do
  scenario 'valid inputs' do
    
    visit root_path
    click_on 'Sign in with Google'
    
    visit new_comment_path
    fill_in 'Commentid', with: 12345678
    fill_in 'Postid', with: 1234567
    fill_in 'Posterid', with: 123456
    select '2021', :from => 'comment_commentDate_1i'
    select 'December', :from => 'comment_commentDate_2i'
    select '25', :from => 'comment_commentDate_3i'
    fill_in 'Message', with: "Ayo its me a comment"

    click_on 'Create Comment'
    visit comments_path
    expect(page).to have_content(12345678)
    expect(page).to have_content(1234567)
    expect(page).to have_content(123456)
    expect(page).to have_content('2021-12-25')
    expect(page).to have_content("Ayo its me a comment")
  end
end