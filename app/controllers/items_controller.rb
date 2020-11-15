class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_image, only: [:destroy, :edit, :update, :show]
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
    #redirect_to root_path if @item.destroy
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
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


  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :handling_id, :price).merge(user_id: current_user.id)
  end
end
