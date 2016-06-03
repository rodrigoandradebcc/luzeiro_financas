json.array!(@subgroups) do |subgroup|
  json.extract! subgroup, :id, :code, :name
  json.url subgroup_url(subgroup, format: :json)
end
