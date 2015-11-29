json.array!(@users_with_charger) do |user|
  json.extract! user, :id, :first_name, :last_name, :latitude, :longitude
end
