class ManufacturerParser
  attr_accessor :manufacturers

  def initialize(manufacturers)
    @manufacturers = manufacturers
  end

  def run
    manufacturers.each do |manufacturer_name|
      begin
        manufacturer = Manufacturer.find_or_create_by(name: manufacturer_name)
        next if manufacturer.image_url.present? && manufacturer.description.present?
        formatted_name = manufacturer_name.downcase.gsub(' ','-')
        url = "https://#{formatted_name}.industrial.net"
        page = Nokogiri::HTML(open(url))
        logo_image_url = page.search('.img-wrapper  img').attribute('src').value
        cdn_image_url = Cloudinary::Uploader.upload(logo_image_url)["url"]
        description = page.search('.copy-single p').text
        manufacturer.update(image_url: cdn_image_url) if manufacturer.image_url.blank?
        manufacturer.update(description: description) if manufacturer.description.blank?
        puts "Successfully update #{manufacturer.name}'s logo"
      rescue => e
        puts "Failed on #{manufacturer_name}"
        puts e
      end
    end
  end
end