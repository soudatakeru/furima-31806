class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :set_item, only: [:destroy, :edit, :update, :show]
  before_action :redirect_item, only: [:edit, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_item
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :handling_id, :price).merge(user_id: current_user.id)
  end
end
