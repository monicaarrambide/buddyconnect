class Group < ApplicationRecord
    validates :groupId, presence: true
    validates :leaderInt, presence: true
end
