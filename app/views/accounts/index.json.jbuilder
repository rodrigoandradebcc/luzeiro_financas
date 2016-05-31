json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :type, :code, :description, :credit_balance, :debit_balance
  json.url account_url(account, format: :json)
end
