class User < ApplicationRecord
  has_many :items
  has_many :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
end
