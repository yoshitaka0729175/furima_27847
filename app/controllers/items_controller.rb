class ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  

  private
  def item_params
    params.require(:item).permit(:category_id)
  end
  
end
