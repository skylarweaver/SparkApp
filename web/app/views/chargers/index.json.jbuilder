json.array!(@chargers) do |charger|
  json.extract! charger, :id, :name, :charger_type
  json.url charger_url(charger, format: :json)
end
