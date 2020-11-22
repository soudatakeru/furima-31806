class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  def index
    @purchase = UserPurchase.new
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @purchase = UserPurchase.new(user_purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_purchase_params
    params.require(:user_purchase).permit(:purchase_id, :post_code, :city, :phone_number, :address, :prefecture_id, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end