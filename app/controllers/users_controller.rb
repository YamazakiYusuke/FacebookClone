class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to new_user_path, notice: "このemailのアカウントは既に存在します" if @user.invalid
    if @user.save 
      redirect_to blogs_path, notice: "アカウントを作成しました!ようこそFacebookへ"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
