class Api::V1::ErrorsController < Api::V1::BaseController
  def index
    @errors = Error.by_most_popular
  end

  def show
    @error = Error.find(params[:id])
  end

  def show_api
  end
end
