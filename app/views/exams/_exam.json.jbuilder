json.extract! exam, :id, :name, :description, :start_date, :due_date, :time_limit, :created_at, :updated_at
json.url exam_url(exam, format: :json)
