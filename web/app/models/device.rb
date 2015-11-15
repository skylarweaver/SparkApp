class Device < ActiveRecord::Base
	has_many :owned_devices
	has_many :users, through: :owned_devices
	belongs_to :charger
end
