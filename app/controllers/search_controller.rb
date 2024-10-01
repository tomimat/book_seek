class SearchController < ApplicationController
   def search
    @results = Search.search(params[:keyword])
    render 'search_results'
   end
end
