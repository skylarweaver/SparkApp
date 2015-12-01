json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :charger_id, :lender_id, :borrower_id, :charger_photo
  json.url transaction_url(transaction, format: :json)
end
