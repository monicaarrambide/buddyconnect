require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
    scenario 'valid inputs for basic student' do
        visit new_user_path
        fill_in 'studentId', with: 123456789
        fill_in 'isOfficer', with: false
        fill_in 'isAdmin', with: false
        fill_in 'firstName', with: 'Jimbo'
        fill_in 'lastName', with: 'Fisher'
        fill_in 'tamuEmail', with: 'jf@tamu.edu'
        fill_in 'dateOfBirth', with: '1965-10-09'
        fill_in 'gradAssistance', with: false
        click_on 'Create User'
        visit users_path
        expect(page).to have_content('123456789')
        expect(page).to have_content('Jimbo')
        expect(page).to have_content('Fisher')
        expect(page).to have_content('jf@tamu.edu')
        expect(page).to have_content('1965-10-09')
    end
end