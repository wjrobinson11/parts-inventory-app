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
    @manufacturers = Manufacturer.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
    render layout: false
  end

  def about
    @about_tab = true
    render layout: false
  end
end