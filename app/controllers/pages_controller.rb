class PagesController < ApplicationController
  respond_to :html, :text

  def home
    @last_error_id = Error.last.id
    if params[:query] && params[:query] != ""
      @errors = Error.search_by_keyword(params[:query]).by_most_popular
    else
      @errors = Error.by_most_popular
    end

    if params[:offset]
      @offset = params[:offset]
    end

    @errors = @errors.with_tags.accepted.offset(@offset).limit(3)

    respond_with do |format|
      format.html
      format.text { render partial: "errors/cards", locals: { errors: @errors }, formats: [:html] }
    end
  end

  def about; end

  def learn; end

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
