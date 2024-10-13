class UsersController < ApplicationController
     before_action :ensure_guest_user, only: [:edit]

    def edit
    @user = User.find(params[:id])
    end

     def create
     @user = User.new(user_params)
      @user.user_id = current_user.id
    if @user.save
    redirect_to user_path(@user.id)
    else
      render :index
    end
     end

    def show
     @user = User.find(params[:id])
     @book = Book.all
     @users= User.all
    end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
     redirect_to user_path(@user.id)
    else
      @users = User.all
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end

  private

   def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
   end



end
