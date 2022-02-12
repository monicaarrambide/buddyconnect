json.extract! profile, :id, :profileId, :userId, :year, :picture, :contactInfo, :created_at, :updated_at
json.url profile_url(profile, format: :json)
