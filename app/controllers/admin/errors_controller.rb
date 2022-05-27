class Admin::ErrorsController < ApplicationController
  before_action :check_admin
  before_action :set_error, only: %i[accept reject]

  def index
    @pending_errors = Error.includes(:tags).pending
    @accepted_errors = Error.includes(:tags).accepted
    @rejected_errors = Error.includes(:tags).rejected
  end

  def accept
    @error.accepted!

    redirect_to admin_errors_path, notice: "Error accepted"
  end

  def reject
    @error.rejected!

    redirect_to admin_errors_path, notice: "Error rejected"
  end

  private

  def set_error
    @error = Error.find(params[:id])
  end

  def check_admin
    redirect_to(root_path, notice: "You don't have access to that page") unless user_signed_in? && current_user.admin?
  end
end
