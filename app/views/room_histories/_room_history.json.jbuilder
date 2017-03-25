json.extract! room_history, :id, :room_id, :user_id, :start_time, :end_time, :status, :created_at, :updated_at
json.url room_history_url(room_history, format: :json)