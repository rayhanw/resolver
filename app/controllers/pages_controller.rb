class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    if params[:query] && params[:query] != ""
      sql_query = "errors.title @@ :query OR errors.details @@ :query"
      @errors = Error.where(sql_query, query: params[:query]).by_most_popular
    else
      @errors = Error.by_most_popular
    end
  end

  def about; end
end
