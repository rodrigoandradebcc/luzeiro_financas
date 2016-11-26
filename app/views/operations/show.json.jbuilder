json.extract! @operation, :id, :value, :description, :release_date, :created_at, :updated_at
json.url operation_url(@operation, format: :json)