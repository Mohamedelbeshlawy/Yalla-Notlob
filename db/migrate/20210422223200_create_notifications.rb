class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.bigint :recipient_id
      t.bigint :actor_id
      t.datetime :read_at
      t.string :action
      t.string :model
      t.integer :category
      #t.references :notifiable, polymorphic: true

      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :recipient_id
    add_foreign_key :notifications, :users, column: :actor_id
  end
end