class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new
  end

  def create
    @purchase = UserPurchase.new(user_purchase_params)
    #unless @item.user_id == @item.user_id || if @items.present?
      #redirect_to action: :index
    #end
    @item = Item.find(params[:item_id])
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end


    private
    def user_purchase_params
      params.require(:user_purchase).permit(:purchase_id, :post_code, :city, :phone_number, :address, :prefecture_id, :building_name).merge(user_id: current_user.id, item_id: (params[:item_id]))
    end
end



