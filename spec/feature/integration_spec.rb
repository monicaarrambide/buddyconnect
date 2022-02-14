require 'rails_helper'

RSpec.describe 'Creating a post', type: :feature do
    scenario 'valid inputs for postid' do
        visit new_post_path
        fill_in 'Postid', with: 2468
        fill_in 'Posterid', with: 123456789
        select '2021', :from => 'post_postDate_1i'
        select 'May', :from => 'post_postDate_2i'
        select '25', :from => 'post_postDate_3i'
        fill_in 'Title', with: 'Hi everyone!'
        fill_in 'Body', with: 'I just wanted to say hello'
        click_on 'Create Post'
        visit posts_path
        expect(page).to have_content(2468)
    end

    scenario 'valid inputs for posterid' do
        visit new_post_path
        fill_in 'Postid', with: 2468
        fill_in 'Posterid', with: 123456789
        select '2021', :from => 'post_postDate_1i'
        select 'May', :from => 'post_postDate_2i'
        select '25', :from => 'post_postDate_3i'
        fill_in 'Title', with: 'Hi everyone!'
        fill_in 'Body', with: 'I just wanted to say hello'
        click_on 'Create Post'
        visit posts_path
        expect(page).to have_content(123456789)
    end

    scenario 'valid inputs for postDate' do
        visit new_post_path
        fill_in 'Postid', with: 2468
        fill_in 'Posterid', with: 123456789
        select '2021', :from => 'post_postDate_1i'
        select 'May', :from => 'post_postDate_2i'
        select '25', :from => 'post_postDate_3i'
        fill_in 'Title', with: 'Hi everyone!'
        fill_in 'Body', with: 'I just wanted to say hello'
        click_on 'Create Post'
        visit posts_path
        expect(page).to have_content('2021-05-25')
    end

    scenario 'valid inputs for Title' do
        visit new_post_path
        fill_in 'Postid', with: 2468
        fill_in 'Posterid', with: 123456789
        select '2021', :from => 'post_postDate_1i'
        select 'May', :from => 'post_postDate_2i'
        select '25', :from => 'post_postDate_3i'
        fill_in 'Title', with: 'Hi everyone!'
        fill_in 'Body', with: 'I just wanted to say hello'
        click_on 'Create Post'
        visit posts_path
        expect(page).to have_content('Hi everyone!')
    end
    
    scenario 'valid inputs for Body' do
        visit new_post_path
        fill_in 'Postid', with: 2468
        fill_in 'Posterid', with: 123456789
        select '2021', :from => 'post_postDate_1i'
        select 'May', :from => 'post_postDate_2i'
        select '25', :from => 'post_postDate_3i'
        fill_in 'Title', with: 'Hi everyone!'
        fill_in 'Body', with: 'I just wanted to say hello'
        click_on 'Create Post'
        visit posts_path
        expect(page).to have_content('I just wanted to say hello')
    end

    scenario 'invalid inputs for title' do
        visit new_post_path
        fill_in 'Title', with: ''
        click_on 'Create Post'
        expect(page).to have_content("Title can't be blank")
    end

    scenario 'invalid inputs for postid' do
        visit new_post_path
        fill_in 'Postid', with: ''
        click_on 'Create Post'
        expect(page).to have_content("Postid can't be blank")
    end

    scenario 'invalid inputs for posterid' do
        visit new_post_path
        fill_in 'Posterid', with: ''
        click_on 'Create Post'
        expect(page).to have_content("Posterid can't be blank")
    end

    scenario 'invalid inputs for Body' do
        visit new_post_path
        fill_in 'Body', with: ''
        click_on 'Create Post'
        expect(page).to have_content("Body can't be blank")
    end
end