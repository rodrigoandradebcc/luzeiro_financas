json.array!(@subitems) do |subitem|
  json.extract! subitem, :id, :code, :name
  json.url subitem_url(subitem, format: :json)
end
