json.array!(@seventh_levels) do |seventh_level|
  json.extract! seventh_level, :id, :code, :name, :analytic, :balance_id, :sixth_level_id
  json.url seventh_level_url(seventh_level, format: :json)
end
