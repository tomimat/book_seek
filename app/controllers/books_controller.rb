class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @tag_list=Tag.all
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      tag_list=params[:book][:name].split(',')
    if @book.save!
      # @book.save_tag(tag_list)
      redirect_to book_path(@book.id),notice:'投稿完了しました:)'
    else
      @tag_list=Tag.all
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
      @book = Book.find(params[:id])
        @book = Post.find(params[:id])

    @tag_list=@book.tags.pluck(:name).join(',')
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
    @book = Book.find(params[:id])
   # @book_comment=BookComment.new
    @book_tags = @book.tags
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  def update
     @book = Book.find(params[:id])
      tag_list=params[:book][:name].split(',')
    if @book.update(book_params)
      if params[:post][:status]== "公開"
       @old_relations=PostTag.where(post_id: @post.id)
      @old_relations.each do |relation|
        relation.delete
        end
         @post.save_tag(tag_list)
        redirect_to post_path(@post.id), notice: '更新完了しました:)'
      redirect_to book_path(@book.id),notice:'投稿完了しました:)'
      else
      end
      @books = Book.all
      render :edit
    end

     def search
    @results = Book.search(params[:keyword])
    render 'search_results'
     end
  end

   def search_tag

    @tag_list=Tag.all

    @tag=Tag.find(params[:tag_id])

    @posts=@tag.posts.page(params[:page]).per(10)
   end

    private

  def book_params
    params.require(:book).permit(:name)
  end

end
