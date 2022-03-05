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
end
