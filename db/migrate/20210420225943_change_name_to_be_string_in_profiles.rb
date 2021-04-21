class ChangeNameToBeStringInProfiles < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :meal_type, :integer
    change_column :orders, :order_status, :integer
  end
end
