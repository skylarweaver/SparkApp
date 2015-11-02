json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :charger_id, :user_id
  json.url transaction_url(transaction, format: :json)
end
