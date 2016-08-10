json.array!(@second_synthetic_accounts) do |second_synthetic_account|
  json.extract! second_synthetic_account, :id, :code, :name, :description, :balance, :synthetic_account_id
  json.url second_synthetic_account_url(second_synthetic_account, format: :json)
end
