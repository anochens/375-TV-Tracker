class SearchesController < ApplicationController
  layout 'application'

def index
        @results = Search.search(params[:search])
        respond_to do |format|
            format.html
            format.xml  { render :xml => @episodes }
        end
    end
end
