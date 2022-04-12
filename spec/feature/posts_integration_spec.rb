# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Creating a post', type: :feature) do
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:user] # If using Devise
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]

  it 'valid inputs for Title' do
    visit root_path
    click_on 'Sign in with TAMU'
    visit new_post_path
    fill_in 'Title', with: 'Hi everyone!'
    fill_in 'Body', with: 'I just wanted to say hello'
    click_on 'Create Post'
    visit posts_path
    expect(page).to(have_content('Hi everyone!'))
  end

  it 'valid inputs for Body' do
    visit root_path
    click_on 'Sign in with TAMU'
    visit new_post_path
    fill_in 'Title', with: 'Hi everyone!'
    fill_in 'Body', with: 'I just wanted to say hello'
    click_on 'Create Post'
    visit posts_path
    expect(page).to(have_content('I just wanted to say hello'))
  end

  it 'invalid inputs for title' do
    visit root_path
    click_on 'Sign in with TAMU'
    visit new_post_path
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'I just wanted to say hello'
    click_on 'Create Post'
    expect(page).to(have_content("Title can't be blank"))
  end

  it 'from forum page' do
    visit root_path
    click_on 'Sign in with TAMU'
    visit posts_path
    fill_in 'title', with: 'Harry Potter'
    fill_in 'body', with: 'A great book'
    click_on 'Create Post'
    expect(page).to(have_content('Harry Potter'))

    visit posts_path
    expect(page).to(have_content('Harry Potter'))
  end
end

# # UPDATING
RSpec.describe('Updating a post', type: :feature) do
  it 'valid inputs' do
    visit root_path
    click_on 'Sign in with TAMU'
    posting = Post.create!(postId: 2468, posterId: 123_456_789, postDate: '2022-02-02', title: 'Hi', body: 'Hello everyone!')
    visit edit_post_path(id: posting.id)
    fill_in 'Title', with: 'Harry Potter'
    click_on 'Update Post'
    visit posts_path
    expect(page).to(have_content('Harry Potter'))
  end

  it 'invalid title input' do
    visit root_path
    click_on 'Sign in with TAMU'
    posting = Post.create!(postId: 2468, posterId: 123_456_789, postDate: '2022-02-02', title: 'Hi', body: 'Hello everyone!')
    visit edit_post_path(id: posting.id)
    fill_in 'Title', with: ''
    click_on 'Update Post'
    expect(page).to(have_content("Title can't be blank"))
  end

  it 'invalid body input' do
    visit root_path
    click_on 'Sign in with TAMU'
    posting = Post.create!(postId: 2468, posterId: 123_456_789, postDate: '2022-02-02', title: 'Hi', body: 'Hello everyone!')
    visit edit_post_path(id: posting.id)
    fill_in 'Body', with: ''
    click_on 'Update Post'
    expect(page).to(have_content("Body can't be blank"))
  end
end

# SHOW
RSpec.describe('Show a post', type: :feature) do
  it 'correct post' do
    visit root_path
    click_on 'Sign in with TAMU'
    posting = Post.create!(postId: 2468, posterId: 123_456_789, postDate: '2022-02-02', title: 'Hi', body: 'Hello everyone!')
    visit post_path(id: posting.id)
    expect(page).to(have_content('Hello everyone!'))
  end
end

RSpec.describe('Routing', type: :feature) do
  it 'posts page to specific post' do
    visit root_path
    click_on 'Sign in with TAMU'
    posting = Post.create!(postId: 2468, posterId: 123_456_789, postDate: '2022-02-02', title: 'Hi', body: 'Hello everyone!')
    visit posts_path
    click_on 'Hi'
    expect(page).to(have_content('Hello everyone!'))
  end

  it 'post to all posts' do
    visit root_path
    click_on 'Sign in with TAMU'
    posting = Post.create!(postId: 2468, posterId: 123_456_789, postDate: '2022-02-02', title: 'Hi', body: 'Hello everyone!')
    visit post_path(id: posting.id)
    click_on 'Back'
    expect(page).to(have_content('BuddyConnect Forum'))
  end
end
