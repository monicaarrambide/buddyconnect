require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Dateofbirth", with: @user.dateOfBirth
    fill_in "Firstname", with: @user.firstName
    check "Gradassistance" if @user.gradAssistance
    fill_in "Groupid", with: @user.groupId
    fill_in "Insterestsid", with: @user.insterestsId
    check "Isadmin" if @user.isAdmin
    check "Isofficer" if @user.isOfficer
    fill_in "Lastname", with: @user.lastName
    fill_in "Profileid", with: @user.profileId
    fill_in "Studentid", with: @user.studentId
    fill_in "Tamuemail", with: @user.tamuEmail
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Dateofbirth", with: @user.dateOfBirth
    fill_in "Firstname", with: @user.firstName
    check "Gradassistance" if @user.gradAssistance
    fill_in "Groupid", with: @user.groupId
    fill_in "Insterestsid", with: @user.insterestsId
    check "Isadmin" if @user.isAdmin
    check "Isofficer" if @user.isOfficer
    fill_in "Lastname", with: @user.lastName
    fill_in "Profileid", with: @user.profileId
    fill_in "Studentid", with: @user.studentId
    fill_in "Tamuemail", with: @user.tamuEmail
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
