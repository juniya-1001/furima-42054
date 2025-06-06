class OrderAddress
  include ActiveModel::Model
  attr_accessor :zipcode, :prefecture_id, :city, :street, :building, :tel_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :zipcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street
    validates :tel_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits without hyphens' }
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zipcode: zipcode, prefecture_id: prefecture_id, city: city, street: street, building: building, tel_number: tel_number,
                   order_id: order.id)
  end
end
