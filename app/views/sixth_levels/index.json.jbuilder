json.array!(@sixth_levels) do |sixth_level|
  json.extract! sixth_level, :id, :code, :name, :analytic, :balance_id, :fifth_level_id
  json.url sixth_level_url(sixth_level, format: :json)
end
