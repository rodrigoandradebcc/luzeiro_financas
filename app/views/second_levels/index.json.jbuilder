json.array!(@second_levels) do |second_level|
  json.extract! second_level, :id, :code, :name, :balance_id
  json.url second_level_url(second_level, format: :json)
end
