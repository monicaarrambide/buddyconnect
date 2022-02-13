json.extract! user, :id, :studentId, :groupId, :insterestsId, :profileId, :isOfficer, :isAdmin, :firstName, :lastName, :tamuEmail, :dateOfBirth, :gradAssistance, :created_at, :updated_at
json.url user_url(user, format: :json)
