json.array!(@operations) do |operation|
  json.extract! operation, :id, :value_input, :value_output, :description, :release_date
  json.url operation_url(operation, format: :json)
end
