class OwnedDevice < ActiveRecord::Base
	belongs_to :device
  belongs_to :user

  	def device_name 
  		Device.find(self.device_id).name
  	end

  	def charger_name
  		Charger.find(Device.find(self.device_id).charger_id).name
  	end

end
