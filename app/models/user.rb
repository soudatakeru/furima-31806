class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6}\z/
    validates :password, presence: true,
              format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  VALID_LAST_NAME =/^[ぁ-んァ-ヶー一-龠]+$/
    validates :last_name:, presence: true,
              format: { with: VALID_LAST_NAME }
  VALID_FIRST_NAME =/^[ぁ-んァ-ヶー一-龠]+$/
    validates :first_name, presence: true
              format: { with: VALID_LAST_NAME }
  VALID_LAST_NAME_KANA =/^[ア-ン゛゜ァ-ォャ-ョー「」、]+$/
    validates :last_name_kana:, presence: true,
              format: { with: VALID_LAST_NAME_KANA }
  VALID_FIRST_NAME_KANA =/^[ア-ン゛゜ァ-ォャ-ョー「」、]+$/
    validates :first_name_kana, presence: true
              format: { with: VALID_LAST_NAME_KANA }
  validates :birthday, presence: true
     
end
