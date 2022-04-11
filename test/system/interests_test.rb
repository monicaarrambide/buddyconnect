# frozen_string_literal: true

require 'application_system_test_case'

class InterestsTest < ApplicationSystemTestCase
  setup do
    @interest = interests(:one)
  end

  test 'visiting the index' do
    visit interests_url
    assert_selector 'h1', text: 'Interests'
  end

  test 'creating a Interest' do
    visit interests_url
    click_on 'New Interest'

    fill_in 'Careerinterest', with: @interest.careerInterest
    fill_in 'Expectations', with: @interest.expectations
    fill_in 'Favmoviegenres', with: @interest.favMovieGenres
    fill_in 'Hobbies', with: @interest.hobbies
    fill_in 'Interestsid', with: @interest.interestsId
    fill_in 'Numberprereqs', with: @interest.numberPrereqs
    fill_in 'Userid', with: @interest.userId
    click_on 'Create Interest'

    assert_text 'Interest was successfully created'
    click_on 'Back'
  end

  test 'updating a Interest' do
    visit interests_url
    click_on 'Edit', match: :first

    fill_in 'Careerinterest', with: @interest.careerInterest
    fill_in 'Expectations', with: @interest.expectations
    fill_in 'Favmoviegenres', with: @interest.favMovieGenres
    fill_in 'Hobbies', with: @interest.hobbies
    fill_in 'Interestsid', with: @interest.interestsId
    fill_in 'Numberprereqs', with: @interest.numberPrereqs
    fill_in 'Userid', with: @interest.userId
    click_on 'Update Interest'

    assert_text 'Interest was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Interest' do
    visit interests_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Interest was successfully destroyed'
  end
end
