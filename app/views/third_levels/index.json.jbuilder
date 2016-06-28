json.array!(@third_levels) do |third_level|
  json.extract! third_level, :id, :code, :name, :second_level_id
  json.url third_level_url(third_level, format: :json)
end
