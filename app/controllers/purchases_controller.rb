class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_shippinginfo = PurchaseShippinginfo.new
  end

  def create
  end
end
