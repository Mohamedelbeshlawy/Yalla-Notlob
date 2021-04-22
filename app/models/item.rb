class Item < ApplicationRecord
  belongs_to :order
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true
  validates :price, presence: true
end
