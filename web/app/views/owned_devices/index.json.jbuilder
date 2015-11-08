json.array!(@owned_devices) do |owned_device|
  json.extract! owned_device, :id, :user_id, :device_id, :personal_device_name
  json.url owned_device_url(owned_device, format: :json)
end
