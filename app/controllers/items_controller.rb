class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else

      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    redirect_to root_path if item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :shipping_charge_id, :area_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
    redirect_to root_path if @item.user_id != current_user.id || !@item.purchase.nil?
  end
end
