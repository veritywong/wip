require 'open-uri'
require 'pry'
require 'nokogiri'

class ExhibitionScraper
  def self.scrape 
    doc = Nokogiri::HTML(URI.open('https://www.artrabbit.com/all-listings/united-kingdom/london/current-popular'))
    #binding.pry
    exhibitions = []
    doc.css('article.m_listing-item').each do |listing|
        link = listing.css('a.m_listing-link').attribute('href').value

        # to get the img url - all working!
        # img = listing.css('source').last.attribute('srcset').value
        # img_url = img.gsub(/.*\/\/([^ ]*).*/, '\1')
        # puts img_url
        # title = listing.css('p.b_small-heading').first.text
        # dates = listing.css('p.b_small-heading').last.text
        # split_dates = dates.split(' - ')

        url = "https://www.artrabbit.com#{link}"
        begin
            exhibition_doc = Nokogiri::HTML(URI.open(url))
            
            exhibition_doc.css('div.l_inner-grid').last.each do |exhibition|
                binding.pry
                # gallery = exhibition.xpath('.//a[@class="bb_self-target"]')&.text # not working
                #puts title
                # puts gallery
                # artist = exhibition.xpath('.//p[@class="m_ci-title"]')&.text
                # puts artist
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