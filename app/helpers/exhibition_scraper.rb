require 'open-uri'
require 'pry'
require 'nokogiri'

class ExhibitionScraper
  def self.scrape 
    city = 'sheffield'
    doc = Nokogiri::HTML(URI.open("https://www.artrabbit.com/all-listings/united-kingdom/#{city}/current-popular"))
    #binding.pry
    exhibitions = []
    doc.css('article.m_listing-item').each do |listing|
        link = listing.css('a.m_listing-link').attribute('href').value

        # to get the img url - all working!
        # img = listing.css('source').last.attribute('srcset').value
        # img_url = img.gsub(/.*\/\/([^ ]*).*/, '\1')
        # puts img_url

        url = "https://www.artrabbit.com#{link}"
        begin
            exhibition_doc = Nokogiri::HTML(URI.open(url))
            
            exhibition_doc.css('div.main').each do |exhibition|
              title = exhibition.css('h1.b_large-heading').text
              puts title
              dates = exhibition.css('h3.b_large-heading').text
            #   # split_dates = dates.split(' - ')

            #   opening_times = {}
            #   exhibition.css('dt').each_with_index do |day, index|
            #     opening_times[day.text.downcase.to_sym] = exhibition.css('dd')[index].text.strip
            #   end

            #   puts opening_times
     
            end  
            
        rescue OpenURI::HTTPError => e
            puts "Error opening link: #{e.message}"
            next  # Skip to the next iteration if an error occurs
        end 
        
       
        # db_exhibition = Exhibition.find_by(title: title)
        # new_exhibition = Exhibition.create(title: title, gallery_name: gallery, url: url, start_date: split_dates[0], end_date: split_dates[1]) if db_exhibition.nil?
        # exhibitions << new_exhibition
    end

    if exhibitions.all?(&:nil?)
      Exhibition.all
    else
      exhibitions
    end
  end
end