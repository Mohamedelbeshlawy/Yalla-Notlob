class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :meal_type
      t.string :restaurant_name
      t.integer :order_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
