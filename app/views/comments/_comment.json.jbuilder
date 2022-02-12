json.extract! comment, :id, :commentId, :postId, :posterId, :commentDate, :message, :created_at, :updated_at
json.url comment_url(comment, format: :json)
