json.array!(@accounts) do |account|
  json.extract! account, :id, :code, :name, :description, :analytic, :balance, :account_type_id, :chart_of_account_id
  json.url account_url(account, format: :json)
end
