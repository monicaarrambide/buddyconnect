class User < ApplicationRecord
	validates :studentId, presence: true
    validates :isOfficer, inclusion: { in: [ true, false ] }
    validates :isAdmin, inclusion: { in: [ true, false ] }
    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :tamuEmail, presence: true
    validates :dateOfBirth, presence: true
    validates :gradAssistance, inclusion: { in: [ true, false ] }  
end
