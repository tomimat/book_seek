class SearchController < ApplicationController
   def search
    @results = Book.search(params[:keyword])
    if params[:star].present?
     @results = @results.search_star(params[:star])
    end
    @tag_list = Tag.all

    render 'search'
   end
end
