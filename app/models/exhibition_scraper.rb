require 'open-uri'
require 'nokogiri'

class ExhibitionScraper
  def self.scrape 
    doc = Nokogiri::HTML(URI.open('https://www.artrabbit.com/all-listings/united-kingdom/london/current-popular'))
    titles = []
    puts doc.serialize
    doc.xpath('.//a[@class="m_listing-link"]').each do |listing|
        title = listing.xpath('.//p[@class="b_small-heading mod--primary"]')&.text
        puts title
        titles << title
    end
    if titles.all?(&:nil?)
      Title.all
    else
     titles
    end
  end
end