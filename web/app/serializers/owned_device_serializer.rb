class OwnedDeviceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :device_id, :personal_device_name
end
