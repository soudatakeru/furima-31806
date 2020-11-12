class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :handling
  belongs_to :prefecture
  with_options presence: true do
    # validates :item
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :handling_id
    validates :price, numericality: {greater_than: 300, less_than: 9999999},
                      format: { with: /\A[0-9]+\z/}
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :handling_id
    validates :prefecture_id
  end

    

end


