class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_shippinginfo = PurchaseShippinginfo.new
  end

  def create
    @purchase_shippinginfo = PurchaseShippinginfo.new(purchase_params)
    if @purchase_shippinginfo.valid?
      @purchase_shippinginfo.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:purchase_shippinginfo).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] )
  end
end
