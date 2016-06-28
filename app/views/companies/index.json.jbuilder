json.array!(@companies) do |company|
  json.extract! company, :id, :name, :cnpj, :field_of_work, :address, :cep, :user_id
  json.url company_url(company, format: :json)
end
