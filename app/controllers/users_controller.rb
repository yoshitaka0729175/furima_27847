class UsersController < ApplicationController
  def index
  end

  

  def edit
  end

  def update
    if cuurent_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:category_id, :product_status_id, :shipping_charges_id, :shipping_region_id, :days_shipping_id, :price, :info, :name).merge(user_id: current_user.id)
  end

end
