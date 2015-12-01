class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :charger_id
      t.integer :lender_id
      t.integer :borrower_id
      t.integer	:length_time_requested
      t.boolean :accepted
      t.datetime :start_time
      t.datetime :end_time


      t.timestamps null: false
    end
  end
end
