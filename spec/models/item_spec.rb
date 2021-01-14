require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it '必要な情報を適切に入力すると、商品の出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
     it '商品画像が無い場合は出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it '商品名が空だと出品できない' do
       @item.name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it '商品の説明が空だと出品できない' do
      @item.information = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Information can't be blank")
     end
     it 'カテゴリーが空だと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
     end
     it 'カテゴリーidが１だと出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
     end
     it '商品の状態についての情報が空だと出品できない' do
      @item.sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status is not a number")
     end
     it '商品の状態についての情報idが１だと出品できない' do
      @item.sales_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status must be other than 1")
     end
     it '配送料の負担についての情報が空だと出品できない' do
      @item.shipping_fee_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status is not a number")
     end
     it '配送料の負担についての情報idが１だと出品できない' do
      @item.shipping_fee_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")       
     end
     it '発送元の地域についての情報が空だと出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
     end
     it '発送元の地域についての情報idが０だと出品できない' do
      @item.prefecture_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
     end
     it '発送までの日数についての情報が空だと出品できない' do
      @item.scheduled_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery is not a number")
     end
     it '発送までの日数についての情報idが１だと出品できない' do
      @item.scheduled_delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
     end
     it '価格の値が空だと出品できない' do
      @item.sell_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sell price can't be blank")
     end
     it '価格の値が¥299以下であれば登録できない' do
      @item.sell_price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sell price out of setting range")
     end
     it '価格の値が￥10,000,000以上の場合は登録できない' do
      @item.sell_price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sell price out of setting range")
     end
     it '価格の値が半角数字でない場合は出品できない_全角数字の場合' do
      @item.sell_price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sell price Half-width number")
     end
    end
  end
end
