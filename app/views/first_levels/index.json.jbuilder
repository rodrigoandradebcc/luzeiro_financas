json.array!(@first_levels) do |first_level|
  json.extract! first_level, :id, :code, :name, :description, :chart_of_account_id, :balance_id
  json.url first_level_url(first_level, format: :json)
end
