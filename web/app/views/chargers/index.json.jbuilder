json.array!(@chargers) do |charger|
  json.extract! charger, :id, :name, :charger_photo
  json.url charger_url(charger, format: :json)
end
