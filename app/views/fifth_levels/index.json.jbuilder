json.array!(@fifth_levels) do |fifth_level|
  json.extract! fifth_level, :id, :code, :name, :analytic, :balance_id, :fourth_level_id
  json.url fifth_level_url(fifth_level, format: :json)
end
