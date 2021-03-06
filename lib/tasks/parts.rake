desc "This task will retrieve parts details"
namespace :parts do
  task :process1, [:page_number] => :environment do |t, args|
    last_page = 0
    urls = []
    pages = (1..args[:page_number].to_i).to_a.reverse.select{|el| el % 4 == 1};
    pages.each do |page_number|
      puts "-------------------------Getting data for page #{page_number}--------------------------"
      page = Nokogiri::HTML(open("https://www.industrial.net/products?_per=100&_page=#{page_number}"));
      urls = page.search('.post-block a').map{|el| el.attribute('href').value};
      urls.each_with_index do |url, i|
          begin
              puts "Parsing #{url} #{i + 1}/100 page #{page_number} Parts #{Part.count}"
              puts PartsParser.new(url).run
          rescue => e
        puts "***************Failed on #{url}*********************"
          end 
      end
      last_page = page_number
    end
  end
  task :process2, [:page_number] => :environment do |t, args|
    last_page = 0
    urls = []
    pages = (1..args[:page_number].to_i).to_a.reverse.select{|el| el % 4 == 2};
    pages.each do |page_number|
      puts "-------------------------Getting data for page #{page_number}--------------------------"
      page = Nokogiri::HTML(open("https://www.industrial.net/products?_per=100&_page=#{page_number}"));
      urls = page.search('.post-block a').map{|el| el.attribute('href').value};
      urls.each_with_index do |url, i|
          begin
              puts "Parsing #{url} #{i + 1}/100 page #{page_number} Parts #{Part.count}"
              puts PartsParser.new(url).run
          rescue => e
        puts "***************Failed on #{url}*********************"
          end 
      end
      last_page = page_number
    end
  end
  task :process3, [:page_number] => :environment do |t, args|
    last_page = 0
    urls = []
    pages = (1..args[:page_number].to_i).to_a.reverse.select{|el| el % 4 == 3};
    pages.each do |page_number|
      puts "-------------------------Getting data for page #{page_number}--------------------------"
      page = Nokogiri::HTML(open("https://www.industrial.net/products?_per=100&_page=#{page_number}"));
      urls = page.search('.post-block a').map{|el| el.attribute('href').value};
      urls.each_with_index do |url, i|
          begin
              puts "Parsing #{url} #{i + 1}/100 page #{page_number} Parts #{Part.count}"
              puts PartsParser.new(url).run
          rescue => e
        puts "***************Failed on #{url}*********************"
          end 
      end
      last_page = page_number
    end
  end
  task :process4, [:page_number] => :environment do |t, args|
    last_page = 0
    urls = []
    pages = (1..args[:page_number].to_i).to_a.reverse.select{|el| el % 4 == 0};
    pages.each do |page_number|
      puts "-------------------------Getting data for page #{page_number}--------------------------"
      page = Nokogiri::HTML(open("https://www.industrial.net/products?_per=100&_page=#{page_number}"));
      urls = page.search('.post-block a').map{|el| el.attribute('href').value};
      urls.each_with_index do |url, i|
          begin
              puts "Parsing #{url} #{i + 1}/100 page #{page_number} Parts #{Part.count}"
              puts PartsParser.new(url).run
          rescue => e
        puts "***************Failed on #{url}*********************"
          end 
      end
      last_page = page_number
    end
  end
end