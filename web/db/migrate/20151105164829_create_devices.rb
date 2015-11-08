class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :charger_id

      t.timestamps null: false
    end
  end
end
