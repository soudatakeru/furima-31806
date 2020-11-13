require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item )
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "imageとnameとexplanationとcategoryとconditionとpostageとprefectureとhandlingとpriceがあれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceが半角英数字、価格の範囲が300~9999999であれば登録できる" do
         @item.price = "500"
         expect(@item).to be_valid
      end
      it "category_idが1番以外であれば登録できる" do
         @item.category_id = "2"
         expect(@item).to be_valid
      end
      it "condition_idが1以外であれば登録できる" do
        @item.condition_id = "2"
        expect(@item).to be_valid
      end
      it "postage_idが1以外であれば登録できる" do
        @item.postage_id = "2"
        expect(@item).to be_valid
      end
      it "prehecture_idが1以外であれば登録できる" do
        @item.prefecture_id = "2"
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空では登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "category_idが1では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが1では登録できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "postage_idが1では登録できない" do
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end
      it "prefecture_idが1では登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "handling_idが1では登録できない" do
        @item.handling_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300以下では登録できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "priceが9999999以上では登録できない" do
        @item.price = "99999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it "priceが全角では登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英字では登録できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end