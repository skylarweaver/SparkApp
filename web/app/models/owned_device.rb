class OwnedDevice < ActiveRecord::Base
	belongs_to :device
  belongs_to :user

  	def device_name 
  		Device.find(self.device_id).name
  	end

  	def charger_name
  		Charger.find(Device.find(self.device_id).charger_id).name
  	end

  	def charger_id
  		Charger.find(Device.find(self.device_id).charger_id).id
  	end

    def charger_photo
      Charger.find(Device.find(self.device_id).charger_id).charger_photo
    end

end
