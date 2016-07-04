json.array!(@analytic_accounts) do |analytic_account|
  json.extract! analytic_account, :id, :code, :name, :description, :balance, :synthetic_account_id
  json.url analytic_account_url(analytic_account, format: :json)
end
