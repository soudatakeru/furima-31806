class UserPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :city, :phone_number, :address, :prefecture_id, :building_name, :purchase, :item_id, :user_id, :purchase_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :phone_number, length: { maximum: 11 }
    validates :address
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Addresse.create(post_code: post_code, prefecture_id: prefecture_id, city: city, building_name: building_name, phone_number: phone_number, address: address, purchase_id: purchase.id)
  end
end
