json.array!(@elements) do |element|
  json.extract! element, :id, :code, :name, :balance
  json.url element_url(element, format: :json)
end
