require 'rails_helper'

RSpec.describe ItemAddress, type: :model do 
  describe '寄付情報の保存' do
    before do
     user = FactoryBot.create(:user)
     item = FactoryBot.create(:item)
     @item_address = FactoryBot.build(:item_address, user_id: user.id, item_id: item.id)
     sleep 0.7
    end
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_address).to be_valid
    end
    it 'buildeing_nameは空でも保存できること' do
      @item_address.buildeing_name = ''
      expect(@item_address).to be_valid
    end
  end
  # 正しいCON

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @item_address.postal_code = ''
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_address.postal_code = '1234567'
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'area_idを選択していないと保存できないこと' do
      @item_address.area_id = 1
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalitiesが空だと保存できないこと' do
      @item_address.municipalities = ''
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @item_address.house_number = ''
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'telephone_numberが空だと保存できないこと' do
      @item_address.telephone_number = ''
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'userが紐付いていないと保存できないこと' do
      @item_address.user_id = ''
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @item_address.item_id = ''
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @item_address.token = nil
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("Token can't be blank")
    end
    it "telephone_numberが9桁だと保存できないこと" do
      @item_address.telephone_number = '123456789'
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("Telephone number is invalid")
    end
    it "telephone_numberが12桁だと保存できないこと" do
      @item_address.telephone_number = '123456789012'
      @item_address.valid?
      expect(@item_address.errors.full_messages).to include("Telephone number is invalid")
    end
  end
  # 負end
 
 end
end
# rsend