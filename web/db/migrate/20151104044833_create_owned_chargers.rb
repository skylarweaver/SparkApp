class CreateOwnedChargers < ActiveRecord::Migration
  def change
    create_table :owned_chargers do |t|
      t.integer :user_id
      t.integer :charger_id
      t.string :personal_charger_name

      t.timestamps null: false
    end
  end
end
