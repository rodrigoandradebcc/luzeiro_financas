json.array!(@enterprises) do |enterprise|
  json.extract! enterprise, :id, :name, :cnpj, :field_of_work
  json.url enterprise_url(enterprise, format: :json)
end
