class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show

    end
  end

  def search
    @items = Item.search(params[:keyword])
    respond_to do |format|
      format.ht
      format.json
    end
  end

  private

  def item_params
    params.require(:item).permit(:info, :name, :image, :category_id, :product_status_id, :shipping_charges_id, :shipping_region_id, :days_shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
