class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:create]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  # def show
  #   @lead = Lead.find(params[:id])
  #   render layout: false
  # end

  # POST /leads
  # POST /leads.json
  def create
    @part = Part.find_by(id: params[:part_id])
    @lead = Lead.new(lead_params)
    respond_to do |format|
      if verify_recaptcha(model: @lead) && @lead.save
        recipients = Rails.env.development? ? ['wes@keystacksolutions.com'] : ['wes@keystacksolutions.com', 'devery@keystacksolutions.com', 'sales@processindustrialsupply.com']
        recipients.each do |recipient|
          mg_client = Mailgun::Client.new 'key-47d57355b203f2c259f56868c58ff127'
          message_params = {
            from: 'leads@keystack.biz',
            to:   recipient,
            subject: "New lead #{@lead.id + 1398} from #{@lead.origin}",
            text:    "Lead Number: #{@lead.id + 1398}\nName: #{@lead.name}\nEmail: #{@lead.email}\nPhone: #{@lead.phone}\nCompany: #{@lead.company}\nPart: #{@lead.part.try(:part_number)}\nQuantity: #{@lead.quantity}\nSite: #{@lead.origin}\nComments from lead: #{@lead.comments}"
          }
          mg_client.send_message('mg.keystack.biz', message_params) rescue true
        end if !Rails.env.development?
        format.json { render json: @lead, status: :created, location: @lead }
      else
        format.json { render json: @lead.errors, status: 200 }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  # def update
  #   params[:lead][:image_url] = Cloudinary::Uploader.upload(params[:lead][:image])["url"] if params[:lead][:image]
  #   params[:lead][:pdf_url] = Cloudinary::Uploader.upload(params[:lead][:pdf])["url"] if params[:lead][:pdf]
  #   respond_to do |format|
  #     if @lead.update(lead_params)
  #       format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @lead }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @lead.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.permit(:name, :email, :company, :phone, :quantity, :part_id, :origin, :comments)
    end
end
