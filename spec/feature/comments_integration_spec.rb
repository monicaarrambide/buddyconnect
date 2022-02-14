# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a comment', type: :feature do
  scenario 'valid inputs' do
    visit new_comment_path
    fill_in 'commentId', with: 123456789
    fill_in 'postId', with: 12345678
    fill_in 'posterId', with: 1234567
    select '2021', :from => 'comment_commentDate_1i'
    select 'December', :from => 'comment_commentDate_2i'
    select '25', :from => 'comment_commentDate_3i'
    fill_in 'message', with: "Ayo its me a comment"


    click_on 'Create Comment'
    visit comments_path
    expect(page).to have_content(123456789)
    expect(page).to have_content(12345678)
    expect(page).to have_content(1234567)
    expect(page).to have_content(2021-12-25)
    expect(page).to have_content("Ayo its me a comment")
  end
end