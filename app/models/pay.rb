class Pay
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture, :city, :house_number,  :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }



  def save
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, user_id: user.id)
    Order.create(item_id: item.id, user_id: user.id)
  end
end