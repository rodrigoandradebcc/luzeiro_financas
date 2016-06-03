json.array!(@accounts) do |account|
  json.extract! account, :id, :code, :name, :description, :nature_of_the, :balance, :credit_balance, :debit_balance
  json.url account_url(account, format: :json)
end
