# frozen_string_literal: true

class Group < ApplicationRecord
  validates :groupId, presence: true
end
