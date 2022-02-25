class PagesController < ApplicationController
  def home
    @errors = Error.random

    if params[:query]
      # Do something
    end
  end
end
