class OwnedDeviceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :charger_id, :personal_device_name
end
