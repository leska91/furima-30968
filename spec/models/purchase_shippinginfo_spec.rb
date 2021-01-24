require 'rails_helper'

RSpec.describe PurchaseShippinginfo, type: :model do
  before do
    @user1buyer = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_shippinginfo = FactoryBot.build(:purchase_shippinginfo, user_id: @user1buyer.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it '必要な情報を適切に入力すると、商品の購入ができる' do
        expect(@purchase_shippinginfo).to be_valid
      end
    end
    context '購入できないとき' do
      it '郵便番号が空では登録できないこと' do
        @purchase_shippinginfo.postal_code = ''
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが無い場合は登録できないこと' do
        @purchase_shippinginfo.postal_code = '1234567'
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が空では登録できないこと' do
        @purchase_shippinginfo.prefecture_id = ''
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include('Prefecture is not a number')
      end
      it '都道府県idが０では登録できないこと' do
        @purchase_shippinginfo.prefecture_id = 0
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '市区町村が空では登録できないこと' do
        @purchase_shippinginfo.city = ''
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できないこと' do
        @purchase_shippinginfo.address = ''
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できないこと' do
        @purchase_shippinginfo.phone_number = ''
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると登録できないこと' do
        @purchase_shippinginfo.phone_number = '090-0000-1111'
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include('Phone number は半角数字ハイフンなし11桁以内で入力してください')
      end
      it '電話番号が12桁以上の場合は登録できないこと' do
        @purchase_shippinginfo.phone_number = '090000011110'
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include('Phone number は半角数字ハイフンなし11桁以内で入力してください')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shippinginfo.token = ''
        @purchase_shippinginfo.valid?
        expect(@purchase_shippinginfo.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
