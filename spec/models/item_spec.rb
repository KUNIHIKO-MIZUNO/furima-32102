require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it '全ての情報が正しい場合登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録がうまくいかないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explainが空では登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥9,999,999以上では登録できない' do
        @item.price =  10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = '１あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが¥300以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'category_idが「---」では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'condition_idが「---」では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'delivery_cost_idが「---」では登録できない' do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery cost Select')
      end
      it 'prefecture_idが「---」では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'delivery_how_long_idが「---」では登録できない' do
        @item.delivery_how_long_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery how long Select')
      end
    end
  end
end
