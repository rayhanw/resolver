class Admin::ErrorsController < ApplicationController
  before_action :check_admin

  def index
    @pending_errors = Error.includes(:tags).pending
    @accepted_errors = Error.includes(:tags).accepted
  end

  def accept
  end

  private

  def check_admin
    redirect_to(root_path, notice: "You don't have access to that page") unless user_signed_in? && current_user.admin?
  end
end
