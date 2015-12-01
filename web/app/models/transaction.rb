class Transaction < ActiveRecord::Base
	belongs_to :borrowers, foreign_key: "borrower_id", class_name: "User"
	belongs_to :lender, foreign_key: "lender_id", class_name: "User"
end
