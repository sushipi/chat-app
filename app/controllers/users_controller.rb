class UsersController < ApplicationController

  def edit
  end

  def update 
    if current_user.update(user_params)#保存できた場合
      redirect_to root_path
    else
      render :edit #保存できない場合
    end
  end  
  
  private
  def user_params 
    params.require(:user).permit(:name, :email)
  end
end
