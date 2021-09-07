require 'rails_helper'

RSpec.describe ItemAddress, type: :model do 
  describe '寄付情報の保存' do
    before do
     user = FactoryBot.create(:user)
     item = FactoryBot.create(:item)
     @item_address = FactoryBot.build(:item_address, user_id: user.id, item_id: item.id)
    end
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
    end
  end
  # 正しいCON

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    end
    it 'area_idを選択していないと保存できないこと' do
    end
    it 'municipalitiesが空だと保存できないこと' do
    end
    it 'house_numberが空だと保存できないこと' do
    end
    it 'telephone_numberが空だと保存できないこと' do
    end
    it 'userが紐付いていないと保存できないこと' do
    end
    it 'itemが紐付いていないと保存できないこと' do
    end
  end
  # 負end
 
 end
end
# rsend