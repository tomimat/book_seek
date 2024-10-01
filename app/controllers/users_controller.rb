class UsersController < ApplicationController

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

end
