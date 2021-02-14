require 'rails_helper'

RSpec.describe OrderStreetAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_street_address, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入機能について' do
    context "購入できる時" do
      it "tokenとpostal_codeとprefecture_idとcityとaddressesとphone_numberが正しく入力されれば登録できる" do
        expect(@order).to be_valid
      end
    end

    context "購入できない時" do
      it "tokenがないと登録できない" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では購入できないこと" do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "正しい郵便番号でないと購入できないこと" do
        @order.postal_code = "5960000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 郵便番号を正しく入力してください")
      end
      it "都道府県が空では購入できないこと" do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefectureのidが1では購入出来ないこと" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空では購入できないこと" do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では購入できないこと" do
        @order.addresses = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end
      it "電話番号が空では購入できないこと" do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は半角数字11桁でないと購入できないこと" do
        @order.phone_number = "0000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number 携帯電話の番号を正しく入力してください")
      end
      it "購入に紐ずく商品の情報がないと購入できない" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it "購入に紐ずくユーザーの情報がないと購入できない" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
