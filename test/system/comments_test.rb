require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @comment = comments(:one)
  end

  test "visiting the index" do
    visit comments_url
    assert_selector "h1", text: "Comments"
  end

  test "creating a Comment" do
    visit comments_url
    click_on "New Comment"

    fill_in "Commentdate", with: @comment.commentDate
    fill_in "Commentid", with: @comment.commentId
    fill_in "Message", with: @comment.message
    fill_in "Postid", with: @comment.postId
    fill_in "Posterid", with: @comment.posterId
    click_on "Create Comment"

    assert_text "Comment was successfully created"
    click_on "Back"
  end

  test "updating a Comment" do
    visit comments_url
    click_on "Edit", match: :first

    fill_in "Commentdate", with: @comment.commentDate
    fill_in "Commentid", with: @comment.commentId
    fill_in "Message", with: @comment.message
    fill_in "Postid", with: @comment.postId
    fill_in "Posterid", with: @comment.posterId
    click_on "Update Comment"

    assert_text "Comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment" do
    visit comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment was successfully destroyed"
  end
end
