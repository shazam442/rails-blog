class SearchController < ApplicationController
  def index
    @posts = @query.result(distinct: true)
  end
end
