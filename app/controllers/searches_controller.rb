class SearchesController < ApplicationController
  layout 'application'

	def index
        @results = Search.search(params[:search])
   end
end
