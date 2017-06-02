class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_site_domain

  def set_site_domain
    @site_top_domain = request.domain
    @site_domain = "www.#{@site_top_domain}"
    @site_domain = @site_domain + ':' + request.port.to_s if Rails.env.development?
    @site_top_domain = @site_top_domain + ':' + request.port.to_s if Rails.env.development?
  end
end
