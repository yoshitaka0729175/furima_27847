class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  def index
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

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :product_status_id, :shipping_charges_id, :shipping_region_id, :days_shipping_id, :price, :info, :name, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
