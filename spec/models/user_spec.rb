require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上、半角英数混合であれば登録できる" do
        @user.password = "aaa111"
        expect(@user).to be_valid
      end
      it "emailに@があれば登録できる" do
        @user.email = "aaaaaaa@aa"
        expect(@user).to be_valid
      end
      it "last_nameは全角であれば登録できる" do
        @user.last_name = "あああ"
        expect(@user).to be_valid
      end
      it "first_nameは全角であれば登録できる" do
        @user.first_name = "いいい"
        expect(@user).to be_valid
      end
      it "last_name_kanaは全角(カタカナ)であれば登録できる" do
        @user.last_name_kana = "アア"
        expect(@user).to be_valid
      end
      it "first_name_kanaは全角(カタカナ)であれば登録できる" do
        @user.first_name_kana = "イイ"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "同じemailがあると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がないと登録できない"do
        @user.email = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは全角では登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "passwordは英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationがない場合は登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致しない場合は登録できない" do
        @user.password = "aaa111"
        @user.password_confirmation ="a111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが数字では登録できない" do
        @user.last_name = "２２"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが数字では登録できない" do
        @user.first_name = "２２"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_nakaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "last_name_kanaがカタカナでなければ登録できない" do
        @user.last_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaがカタカナでなければ登録できない" do
        @user.first_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
