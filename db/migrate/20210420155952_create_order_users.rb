class CreateOrderUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :order_users do |t|
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
