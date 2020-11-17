class UserPurchase
  include ActiveModel::Model
  attr_accessor :nickname, :birthday, :last_name, :first_name, :last_name_kana, :first_name_kana, :password, :image, :name, :explanation, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :handling_id, :price, :post_code, :city, :phone_number, :address
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/.freeze } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/.freeze } do
      validates :last_name_kana
      validates :first_name_kana
    end
    with_options format: { with: /\A[a-z0-9]+\z/i.freeze } do
      validates :password, length: { minimum: 6 }
    end

  end
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :handling_id
    validates :price, numericality: { greater_than: 300, less_than: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :handling_id
    validates :prefecture_id
  end
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :address
  end


  def save
    #user = User.create(nickname: nickname, birthday: birthday, last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, password: password)
    #Item.create(image: image, name: name, explanation: explanation, category_id: category_id, postage_id: postage_id, prefecture_id: prefecture_id, handling_id: handling_id, price: price, user_id: user_id, item_id: item_id)
    Addresse.create(post_code: post_code, prefecture_id: prefecture_id, city: city, building_name: building_name, phone_number: phone_number, purchase: purchase, address: address)
  end
end


