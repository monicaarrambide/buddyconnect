class Profile < ApplicationRecord
    validates :profileId, presence: true
    validates :userId, presence: true
    validates :year, presence: true 
    validates :picture, presence: true
    validates :contactInfo, presence: true
end
