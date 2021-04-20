class Order < ApplicationRecord
  belongs_to :user
  has_many :order_user
  has_many :users, through :order_user 

  enum meal_type: [ :Breakfast, :Lunch, :Dinner ]
  enum order_status: [ :Waiting, :Finished, :Cancelled ]

  has_one_attached :restaurant_menu

  validates :meal_type, presence: true
  validates :restaurant_name, presence: true
end
