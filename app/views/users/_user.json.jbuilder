json.extract! user, :id, :username, :password, :admin, :email, :days_in_week, :created_at, :updated_at
json.url user_url(user, format: :json)