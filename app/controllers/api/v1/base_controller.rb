class Api::V1::BaseController < ApplicationController
  respond_to :html, :json
  skip_before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  layout 'api/v1/layouts/application'

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
