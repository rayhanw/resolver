class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    if params[:query] && params[:query] != ""
      @errors = Error.search_by_keyword(params[:query]).by_most_popular
    else
      @errors = Error.by_most_popular
    end
  end

  def about; end

  def docs
    @routes = [
      {
        text: "errors/index",
        url: api_v1_errors_path,
        details: "Endpoint for ALL errors"
      },
      {
        text: "errors/show",
        url: api_v1_show_api_path,
        details: "Endpoint for a specific error"
      }
    ]
  end
end
