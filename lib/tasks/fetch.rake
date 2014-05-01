task :rejuvenate, :name do |name, args|
  require 'open-uri'
  require 'nokogiri'
  puts 'Starting database populate'
  name = args[:name]
  puts "Fetching data for #{name || 'all stations'}"
  data = Nokogiri::XML(open('http://data.tfl.gov.uk/tfl/syndication/feeds/stations-facilities.xml'))
  station_nodes = data.xpath('//station')
  # station_nodes.each do |station|
  #   puts station.xpath('./name').inner_html
  #   # puts station.xpath('./zones/zone').inner_html
  #   puts station.xpath('./Placemark/Point/coordinates').inner_html
  # end
  station = station_nodes.first
  puts station.xpath('./name').inner_html
  puts station.xpath('./contactDetails/address').inner_html
  puts station.xpath('./zones/zone').inner_html
  puts station.xpath('./Placemark/Point/coordinates').inner_html
  puts Station.all
end

namespace :db do

  desc "creates sample data"
  task :sample => :environment do
    puts 'namespaced'
    Station.create({name: 'Wapping', address: 'hello', postcode: 'E1W 3QT', latitude: 0.9, longitude: 23})
    puts Station.all

  end

end