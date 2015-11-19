class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :name, :charger_id, :charger_name
end
