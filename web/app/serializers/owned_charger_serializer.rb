class OwnedChargerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :charger_id, :personal_charger_name
end
