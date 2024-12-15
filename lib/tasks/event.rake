namespace :events do
  desc 'Scrape events from events website'
  task scrape: :environment do
    EventScraper.scrape
  end
end