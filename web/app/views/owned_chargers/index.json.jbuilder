json.array!(@owned_chargers) do |owned_charger|
  json.extract! owned_charger, :id, :user_id, :charger_id, :personal_charger_name
  json.url owned_charger_url(owned_charger, format: :json)
end
