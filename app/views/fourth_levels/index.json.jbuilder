json.array!(@fourth_levels) do |fourth_level|
  json.extract! fourth_level, :id, :code, :name, :analytic, :balance_id, :third_level_id
  json.url fourth_level_url(fourth_level, format: :json)
end
