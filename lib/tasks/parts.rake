desc "This task will retrieve parts details"
task :parts => :environment do
  last_page = 0
  urls = []
  pages = (246..1000).to_a;
  pages.each do |page_number|
    puts "-------------------------Getting data for page #{page_number}--------------------------"
    page = Nokogiri::HTML(open("https://www.industrial.net/products?_per=100&_page=#{page_number}"));
    urls = page.search('.post-block a').map{|el| el.attribute('href').value};
    urls.each_with_index do |url, i|
        begin
            puts "Parsing #{url} #{i + 1} page #{page_number} Parts #{Part.count}"
            puts PartsParser.new(url).run
        rescue => e
      puts "***************Failed on #{url}*********************"
        end 
    end
    last_page = page_number
  end
end