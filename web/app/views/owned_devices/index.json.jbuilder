json.array!(@owned_devices) do |owned_device|
  json.extract! owned_device, :id, :user_id, :device_id, :allow_lending, :personal_device_name, :device_name, :charger_name, :charger_photo
  json.url owned_device_url(owned_device, format: :json)
end
