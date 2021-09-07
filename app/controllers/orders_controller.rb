class OrdersController < ApplicationController
  def index
   
    @item_address =  ItemAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item_address =  ItemAddress.new(donation_params)
    if @item_address.valid?
      @item_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def donation_params
    params.require(:item_address).permit(:postal_code, :area_id, :municipalities, :house_number, :buildeng_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
