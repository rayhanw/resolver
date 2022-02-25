class PagesController < ApplicationController
  def home
    if params[:query]
      sql_query = "errors.title @@ :query OR errors.details @@ :query"
      @errors = Error.where(sql_query, query: params[:query])
    else
      @errors = Error.random
    end
  end
end
