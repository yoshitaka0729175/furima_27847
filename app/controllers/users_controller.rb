class UsersController < ApplicationController


  def show
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params) #更新できたかを条件分岐
      sign_in(@user)
      redirect_to root_path
    else
      render "show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation) #編集できる情報を制限
  end

end
