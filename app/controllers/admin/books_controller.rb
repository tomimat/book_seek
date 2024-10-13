class Admin::BooksController < ApplicationController
   before_action :authenticate_admin!
    def destroy

        @book = Book.find(params[:id])
        @book.destroy
        redirect_to admin_dashboards_path, notice: '投稿を削除しました。'
    end
end
