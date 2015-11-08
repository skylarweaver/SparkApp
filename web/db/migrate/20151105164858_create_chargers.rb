class CreateChargers < ActiveRecord::Migration
  def change
    create_table :chargers do |t|
      t.string :name
      t.string :charger_photo

      t.timestamps null: false
    end
  end
end
