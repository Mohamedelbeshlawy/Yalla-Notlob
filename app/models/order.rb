class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :items

  enum meal_type: [ :Breakfast, :Lunch, :Dinner ]
  enum order_status: [ :Waiting, :Finished, :Cancelled ]

  has_one_attached :restaurant_menu

  validates :meal_type, presence: true
  validates :restaurant_name, presence: true
end
