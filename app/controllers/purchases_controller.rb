class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    
    @purchase = UserPurchase.new
  end

  def create
    binding.pry
  end
end

