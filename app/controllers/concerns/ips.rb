module Ips
  def log_ip
    logger.info("Remote IP: #{request.remote_ip}")
  end
end
