namespace :exhibitions do
  desc 'Scrape exhibitions from exhibitions website'
  task scrape: :environment do
    ExhibitionScraper.scrape
  end
end