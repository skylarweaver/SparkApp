class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :charger_id, :lender_id, :borrower_id, :length_time_requested, :start_time, :end_time, :accepted
end
