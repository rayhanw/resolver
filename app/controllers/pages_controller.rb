class PagesController < ApplicationController
  def home
    @errors = Error.first(5)

    if params[:query]
      # Do something
    end
  end
end
