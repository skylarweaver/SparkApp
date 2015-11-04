class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :charger
	#should there be a borrower entity and a lender entity

	validates_presence_of :user1_id, :user2_id, :charger_id
end
