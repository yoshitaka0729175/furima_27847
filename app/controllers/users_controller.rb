class UsersController < ApplicationController
  def index
    # #キーワードがなければnilを返す
    # return nil  if params[:keyword] == ""
    # #その文字を含むユーザーを探してきて、@userに代入、ただしログインしている自分は除く。10人まで。
    # @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    # respond_to do |format|
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
