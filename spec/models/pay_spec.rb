require 'rails_helper'

RSpec.describe Pay, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @pay = FactoryBot.build(:pay, user_id: @user.id, item_id: @item.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@pay).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @pay.building_name = nil
      expect(@pay).to be_valid
    end
    it 'tokenがあれば保存ができること' do
      expect(@pay).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @pay.postal_code = nil
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @pay.postal_code = '1234567'
      @pay.valid?
      expect(@pay.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが「---」だと保存できない' do
      @pay.prefecture_id = 1
      @pay.valid?
      expect(@pay.errors.full_messages).to include('Prefecture Select')
    end
    it 'cityは空だと保存できないこと' do
      @pay.city = ''
      @pay.valid?
      expect(@pay.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberは空だと保存できないこと' do
      @pay.house_number = nil
      @pay.valid?
      expect(@pay.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @pay.phone_number = nil
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @pay.phone_number = '２０００'
      @pay.valid?
      expect(@pay.errors.full_messages).to include('Phone number Input only number')
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @pay.phone_number = '222222222222'
      @pay.valid?
      expect(@pay.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it 'tokenが空では登録できないこと' do
      @pay.token = ''
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空では登録できないこと' do
      @pay.user_id = ''
      @pay.valid?
      expect(@pay.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できないこと' do
      @pay.item_id = ''
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Item can't be blank")
    end
  end
end
