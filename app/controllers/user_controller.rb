class UserController < ApplicationController
    
    def edit
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
    @user.update(user_params)
    if @user.save
     redirect_to user_path(@user.id)
    else
      @users = User.all
      render :edit
    end
  end

end
