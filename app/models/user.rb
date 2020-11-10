class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6}+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  VALID_LAST_NAME = /\A[ぁ-んァ-ン一-龥]/
    validates :last_name, format: { with: VALID_LAST_NAME }
  VALID_FIRST_NAME = /\A[ぁ-んァ-ン一-龥]/
    validates :first_name, format: { with: VALID_LAST_NAME }
  VALID_LAST_NAME_KANA = /\A[ァ-ヶー－]+\z/
    validates :last_name_kana, format: { with: VALID_LAST_NAME_KANA }
  VALID_FIRST_NAME_KANA = /\A[ァ-ヶー－]+\z/
    validates :first_name_kana, format: { with: VALID_LAST_NAME_KANA }
  validates :birthday, presence: true
     
end
