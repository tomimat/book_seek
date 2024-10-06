class SearchController < ApplicationController
   def search
    @results = Book.search(params[:keyword])
    @tag_list = Tag.all

    render 'search'
   end
end
