class PartsParser
  attr_accessor :url, :page, :attributes

  def initialize(url)
    @url = url
  end

  def run
    return "Already obtained #{url}" if Part.pluck(:part_number).any?{|part_number| part_number.downcase == url.split('https://').last.split('.').first.downcase}
    puts "Retrieving url..."
    page = Nokogiri::HTML(open(url))
    puts "Extracting attributes..."
    specs = {}
    spec_rows = page.search('#specs  tr')
    spec_rows.map{|dd| specs[dd.children[1].text] = dd.children[3].text}
    attributes = {
      part_number: page.search('h1[itemprop="name"]')[0].text,
      manufacturer: page.search('strong[itemprop="manufacturer"]')[0].text,
      description: page.search('p[itemprop="description"]')[0].text,
      quantity_in_stock: page.search('td:contains("Quantity in Stock") ~ *').children.text,
      part_type: page.search('td:contains("Type") ~ *').children.text,
      image_url: page.css("img[itemprop='image']").attribute('src').value,
      specs: specs
    }
    begin
      Part.create!(attributes)
    rescue => e
      puts "#{e} for part #{attributes[:part_number]}"
    end
  end
end