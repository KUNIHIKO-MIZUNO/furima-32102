require 'rails_helper'

RSpec.describe Pay, type: :model do
  describe '購入情報の保存' do
    before do
      @pay = FactoryBot.build(:pay)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
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
      expect(@pay.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @pay.prefecture = 0
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityは空でも保存できること' do
      @pay.city = nil
      expect(@pay).to be_valid
    end
    it 'house_numberは空でも保存できること' do
      @pay.house_number = nil
      expect(@pay).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @pay.building_name = nil
      expect(@pay).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @pay.phone_number = nil
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @pay.phone_number = '２０００'
      @pay.valid?
      expect(@pay.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
  end
end
