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

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explain
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_how_long_id
  end

  validates :price, numericality:{ greater_than_or_equal_to:300, less_than_or_equal_to: 9,999,999, message: 'Price Out of setting range'}    

end