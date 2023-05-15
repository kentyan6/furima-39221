class OrderInformation
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    BuyerInformation.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, order_id: order.id, item_id: item.id)
  end
end