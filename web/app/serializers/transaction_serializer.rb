class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :charger_id, :lender_id, :lender_user, :borrower_user, :borrower_id, :length_time_requested, :start_time, :end_time, :accepted, :created_at

  def lender_user
    User.find(object.lender_id)
  end

  def borrower_user
    User.find(object.borrower_id)
  end

end
