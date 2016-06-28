json.array!(@operations) do |operation|
  json.extract! operation, :id, :value, :description, :launch_date
  json.url operation_url(operation, format: :json)
end
