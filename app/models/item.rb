class Item < ApplicationRecord
  belongs_to :user
  has_one :purchases
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_how_long
end