class ApplicationController < ActionController::Base
  include Ips

  before_action :log_ip

  def default_url_options
    { host: ENV["DOMAIN"] || "http://localhost:3000" }
  end
end
