class CreateOwnedDevices < ActiveRecord::Migration
  def change
    create_table :owned_devices do |t|
      t.integer :user_id
      t.integer :charger_id
      t.string :personal_device_name

      t.timestamps null: false
    end
  end
end
