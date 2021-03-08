class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
   
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :encrypted_password, :self_introduction, :image)
  end
end    