class ChangeRateToDecimalInServices < ActiveRecord::Migration[5.1]
  def change
      change_column :services, :rate, :decimal, precision: 12, scale: 3
  end
end
