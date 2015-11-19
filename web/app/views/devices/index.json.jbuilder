json.array!(@devices) do |device|
  json.extract! device, :id, :name, :charger_id, :charger_name
  json.url device_url(device, format: :json)
end
