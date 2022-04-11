# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

Rails.application.env_config['devise.mapping'] = Devise.mappings[:user] # If using Devise
Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]

RSpec.describe('Creating a comment', type: :feature) do
  it 'valid inputs' do
    visit root_path
    click_on 'Sign in with TAMU'

    visit new_comment_path
    fill_in 'Commentid', with: 12_345_678
    fill_in 'Postid', with: 1_234_567
    fill_in 'Posterid', with: 123_456
    select '2021', from: 'comment_commentDate_1i'
    select 'December', from: 'comment_commentDate_2i'
    select '25', from: 'comment_commentDate_3i'
    fill_in 'Message', with: 'Ayo its me a comment'

    click_on 'Create Comment'
    visit comments_path
    expect(page).to(have_content(12_345_678))
    expect(page).to(have_content(1_234_567))
    expect(page).to(have_content(123_456))
    expect(page).to(have_content('2021-12-25'))
    expect(page).to(have_content('Ayo its me a comment'))
  end
end
