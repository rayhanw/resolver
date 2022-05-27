class ApplicationController < ActionController::Base
  def default_url_options
    { host: ENV["DOMAIN"] || "http://localhost:3000" }
  end
end
