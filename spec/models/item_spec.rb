require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @itme.image = fixture_file_upload('app/assets/images/furima-intro03.png')
  end

  describe '商品の出品' do
    context '商品出品できるとき' do
     it '全ての値が正しく入力されていれば出品できること' do
      expect(@item).to be_valid
     end
    end
    # con end
   
    context '商品が出品できない時' do
     it 'nameが空だと登録出来ない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'explanationが空だと登録出来ない時' do
      @item.explanation  = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'category_idが空だと登録出来ない時' do
      @item.category_id= 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'status_idが空だと登録出来ない時' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'shipping_charge_idが空だと登録出来ない時' do
      @item.shipping_charge_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
    it 'area_id が空だと登録出来ない時' do
      @item.area_id  = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it 'day_idが空だと登録出来ない時' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it 'priceが空だと登録出来ない時' do
      @item.price  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと出品できない' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'priceが300円以下だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが9,999,999円以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    end
    # con2 end
  end
  # descr end
end   
# (RSpecend)
