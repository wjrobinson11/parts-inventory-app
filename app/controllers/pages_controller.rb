class PagesController < ApplicationController
  def home
    @home_tab = true
    render layout: false
  end

  def contact_us
    @contact_us_tab = true
    render layout: false
  end

  def manufacturers
    @manufacturers_tab = true
    render layout: false
  end
end