# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :commentId, presence: true
  validates :postId, presence: true
  validates :posterId, presence: true
  validates :commentDate, presence: true
  validates :message, presence: true
end
