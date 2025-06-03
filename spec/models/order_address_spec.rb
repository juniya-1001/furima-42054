require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  describe '商品購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できること' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zipcodeが空では保存できないこと' do
        @order_address.zipcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zipcode can't be blank")
      end

      it 'prefecture_idが0では保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空では保存できないこと' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end

      it 'tel_numberが空では保存できないこと' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'zipcodeが「3桁ハイフン4桁」の半角文字列以外の場合は保存できないこと' do
        @order_address.zipcode = 'あいうえお１２３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zipcode is invalid. Include hyphen(-)')
      end
      it 'tel_numberが半角以外数字以外の場合は保存できないこと' do
        @order_address.tel_number = 'あいうえお'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number must be 10 or 11 digits without hyphens')
      end
    end
  end
end
