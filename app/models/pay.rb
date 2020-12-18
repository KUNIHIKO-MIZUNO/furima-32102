class Pay
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
  validates :token, presence: true
  validates :city, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :house_number, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
