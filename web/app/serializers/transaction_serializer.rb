class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :charger_id, :lender_id, :borrower_id
end
