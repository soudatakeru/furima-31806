class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :handling
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  with_options presence: true do
    validates :item
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handling_id
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :handling_id
    validates :prefecture_id
  end

    

end


