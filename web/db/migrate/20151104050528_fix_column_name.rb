class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :Chargers, :type, :charger_type
  end
end
