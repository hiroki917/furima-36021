class OrdersController < ApplicationController
  def index
   
    @item_address =  ItemAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item_address =  ItemAddress.new(donation_params)  
    if @item_address.valid?
      Payjp.api_key = "sk_test_ceba244bc1283671a9a1262a"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @item_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def donation_params
    params.require(:item_address).permit(:postal_code, :area_id, :municipalities, :house_number, :buildeng_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
  end
end
