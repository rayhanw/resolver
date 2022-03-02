class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    if params[:query]
      sql_query = "errors.title @@ :query OR errors.details @@ :query"
      @errors = Error.where(sql_query, query: params[:query])
    else
      @errors = Error.random
    end

    @errors = @errors.order(votes: :DESC)
  end
end
