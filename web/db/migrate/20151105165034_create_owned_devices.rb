class CreateOwnedDevices < ActiveRecord::Migration
  def change
    create_table :owned_devices do |t|
      t.integer :user_id
      t.integer :device_id
      t.string :personal_device_name
      t.boolean :allow_lending

      t.timestamps null: false
    end
  end
end
