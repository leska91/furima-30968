class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shippinginfo = PurchaseShippinginfo.new
  end

  def create
    @purchase_shippinginfo = PurchaseShippinginfo.new(purchase_params)
    if @purchase_shippinginfo.valid?
      pay_item
      @purchase_shippinginfo.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shippinginfo).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.sell_price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if (current_user.id == @item.user_id) || @item.purchase.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
