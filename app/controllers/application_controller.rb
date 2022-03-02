class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def is_admin!
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
