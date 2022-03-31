class User < ApplicationRecord
	validates :studentId, presence: true
    validates :isOfficer, inclusion: { in: [ true, false ] }
    validates :isAdmin, inclusion: { in: [ true, false ] }
    validates :fullName, presence: true
    validates :avatarUrl, presence: true
    validates :tamuEmail, presence: true
    validates :dateOfBirth, presence: true
    validates :gradAssistance, inclusion: { in: [ true, false ] }

    devise :omniauthable, omniauth_providers: [:google_oauth2]

    def self.from_google(email:, full_name:, uid:, avatar_url:)
        return nil unless /@tamu.edu\z/.match?(email)
        # create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(tamuEmail: email)
        create_with(
            studentId: SecureRandom.uuid,
            fullName: full_name, 
            avatarUrl: avatar_url, 
            isOfficer: false,
            isAdmin: false,
            tamuEmail: email,
            dateOfBirth: '2022-3-4',
            gradAssistance: false
        ).find_or_create_by!(tamuEmail: email)
        #@TODO could be a bug
    end
end
