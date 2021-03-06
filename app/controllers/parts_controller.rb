class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :index]
  before_action :set_products_tab

  # GET /parts
  # GET /parts.json
  def index
    @parts = Part.search(params[:search]).paginate(:page => params[:page], :per_page => 30)
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
    if @part.nil?
      redirect_url = if Rails.env == 'development'
        "http://www.#{request.domain}:#{request.port}/contact_us?part_number=#{request.subdomain}"
      else
        "http://www.#{request.domain}/contact_us?part_number=#{request.subdomain}"
      end
      return redirect_to redirect_url
    end
    render layout: false
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts
  # POST /parts.json
  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to "/parts?search=#{@part.part_number}", notice: 'Part was successfully created.' }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    params[:part][:image_url] = Cloudinary::Uploader.upload(params[:part][:image])["url"] if params[:part][:image]
    params[:part][:pdf_url] = Cloudinary::Uploader.upload(params[:part][:pdf])["url"] if params[:part][:pdf]
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to "/parts?search=#{@part.part_number}", notice: 'Part was successfully updated.' }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def public_index
    @parts = Part.search(params[:search]).paginate(:page => params[:page], :per_page => 30)
    @part_total_count = Part.search(params[:search]).count
    render layout: false
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url, notice: 'Part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find_by(id: params[:id])
      @part ||= Part.where('lower(subdomain) = ?', request.subdomain.downcase).last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:description, :image_url, :pdf_url, :manufacturer, :part_number, :part_type, :quantity_in_stock, :specs)
    end

    def set_products_tab
      @products_tab = true
    end
end
