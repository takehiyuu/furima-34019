require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能について" do
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it "商品の状態についての情報が必須であること" do
      @item.sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status can't be blank", "Sales status is not a number")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.shipping_fee_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", "Shipping fee status is not a number")
    end
    it "発送元の地域についての情報が必須であること" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.scheduled_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery is not a number")
    end
    it "販売価格についての情報が必須であること" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること" do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 300以上9999999以下で入力して下さい")
    end
    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = "１０００"
      binding.pry
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 販売価格には半角数字のみ使用してください")
    end
  end
end
