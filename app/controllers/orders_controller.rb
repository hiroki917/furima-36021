class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :prevent_url, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  def index
   
    @item_address =  ItemAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item_address =  ItemAddress.new(donation_params)  
    
    @item = Item.find(params[:item_id])

    if @item_address.valid?
      
      pay_item
      @item_address.save
      redirect_to root_path
    else
      
      render :index
    end
  end

  private

  def donation_params
    params.require(:item_address).permit(:postal_code, :area_id, :municipalities, :house_number, :buildeing_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
  end

  def sold_out_item
    if @item.purchase.present?
    redirect_to root_path 
    end
   end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: donation_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user.id == current_user.id || @item.purchase != nil
      redirect_to root_path
    end
  end
end
