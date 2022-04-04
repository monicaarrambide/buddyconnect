json.extract! biography, :id, :userId, :description, :created_at, :updated_at
json.url biography_url(biography, format: :json)
