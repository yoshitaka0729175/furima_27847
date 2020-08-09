class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.all
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
    if item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show 
    @item = image.find(params[:id])
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
    params.require(:item).permit(:category_id, :product_status_id, :shipping_charges_id, :shipping_region_id, :days_shipping_id, :price, :info, :name, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end