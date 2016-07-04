json.array!(@chart_of_accounts) do |chart_of_account|
  json.extract! chart_of_account, :id, :title, :company_id
  json.url chart_of_account_url(chart_of_account, format: :json)
end
