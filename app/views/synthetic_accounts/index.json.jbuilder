json.array!(@synthetic_accounts) do |synthetic_account|
  json.extract! synthetic_account, :id, :code, :name, :description, :balance, :account_id
  json.url synthetic_account_url(synthetic_account, format: :json)
end
