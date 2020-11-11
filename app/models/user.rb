class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  VALID_LAST_NAME = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :last_name, format: { with: VALID_LAST_NAME }
  validates :first_name, format: { with: VALID_LAST_NAME }
  VALID_LAST_NAME_KANA = /\A[ァ-ヶー－]+\z/.freeze
  validates :last_name_kana, format: { with: VALID_LAST_NAME_KANA }
  validates :first_name_kana, format: { with: VALID_LAST_NAME_KANA }
  validates :birthday, presence: true
end
