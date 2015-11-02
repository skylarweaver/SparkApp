class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :charger_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
