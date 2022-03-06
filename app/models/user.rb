class User < ApplicationRecord
	validates :studentId, presence: true
    validates :isOfficer, inclusion: { in: [ true, false ] }
    validates :isAdmin, inclusion: { in: [ true, false ] }
    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :tamuEmail, presence: true
    validates :dateOfBirth, presence: true
    validates :gradAssistance, inclusion: { in: [ true, false ] }

    devise :omniauthable, omniauth_providers: [:google_oauth2]

    def self.from_google(email:, full_name:, uid:, avatar_url:)
        return nil unless /@tamu.edu\z/.match?(email)
        # create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(tamuEmail: email)
        if(User.where(tamuEmail: email).length() > 0)
            find_or_create_by!(tamuEmail:email)
        else
            # redirect_to new_user_path
            create_with(
              studentId: -1,
              firstName: "firstname", 
              lastName: "lastname", 
              isOfficer: false,
              isAdmin: false,
              tamuEmail: email,
              dateOfBirth: '2022-3-4',
              gradAssistance: false
            ).find_or_create_by!(tamuEmail: email)
        end
        #@TODO could be a bug
      end
end
