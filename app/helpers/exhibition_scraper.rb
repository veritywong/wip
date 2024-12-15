require 'open-uri'
require 'pry'
require 'nokogiri'

class EventScraper
  def self.scrape 
    city = 'sheffield'
    doc = Nokogiri::HTML(URI.open("https://www.artrabbit.com/all-listings/united-kingdom/#{city}/current-popular"))
    #binding.pry
    events = []
    doc.css('article.m_listing-item').each do |listing|
        link = listing.css('a.m_listing-link').attribute('href').value

        # to get the img url - all working!
        # img = listing.css('source').last.attribute('srcset').value
        # img_url = img.gsub(/.*\/\/([^ ]*).*/, '\1')
        # puts img_url

        url = "https://www.artrabbit.com#{link}"
        begin
            event_doc = Nokogiri::HTML(URI.open(url))
            
            event_doc.css('div.main').each do |event|
              title = event.css('h1.b_large-heading').text
              puts title
              dates = event.css('h3.b_large-heading').text
            #   # split_dates = dates.split(' - ')

            #   opening_times = {}
            #   event.css('dt').each_with_index do |day, index|
            #     opening_times[day.text.downcase.to_sym] = event.css('dd')[index].text.strip
            #   end

            #   puts opening_times
     
            end  
            
        rescue OpenURI::HTTPError => e
            puts "Error opening link: #{e.message}"
            next  # Skip to the next iteration if an error occurs
        end 
        
       
        # db_event = event.find_by(title: title)
        # new_event = event.create(title: title, gallery_name: gallery, url: url, start_date: split_dates[0], end_date: split_dates[1]) if db_event.nil?
        # events << new_event
    end

    if events.all?(&:nil?)
      event.all
    else
      events
    end
  end
end