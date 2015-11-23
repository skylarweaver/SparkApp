class Device < ActiveRecord::Base
	has_many :owned_devices
	has_many :users, through: :owned_devices
	belongs_to :charger

	def charger_name
		Charger.find(self.charger_id).name
	end

end
