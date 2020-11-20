require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @buyer = FactoryBot.create(:user)
    @purchase = FactoryBot.build(:user_purchase, item_id: @item.id, user_id: @buyer.id)
    sleep 1
  end
  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'tokenとpost_numberとaddressとprefectureがあれば保存できること' do
        expect(@purchase).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'tokenが空では登録できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では登録できない' do
        @purchase.post_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに-がなければ登録できない' do
        
        @purchase.post_code = '3620806'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid")
      end
      it 'cityが空では登録できない' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberがなければ登録できない' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上では登録できない' do
        @purchase.phone_number = '111111111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'addressがなければ登録できない' do
        @purchase.address = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'user_idが空では購入できない' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
