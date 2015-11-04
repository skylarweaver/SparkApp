class Device < ActiveRecord::Base
	belongs_to :charger
	belongs_to :user

	validates_presence_of :name, :charger_id
end
