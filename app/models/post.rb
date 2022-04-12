# frozen_string_literal: true

class Post < ApplicationRecord
  validates :postId, presence: true
  validates :posterId, presence: true
  validates :postDate, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
