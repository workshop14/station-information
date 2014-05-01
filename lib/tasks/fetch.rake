namespace :db do
  desc 'Fetches Information data from api sources'
  task :rejuvenate => :environment do
    require 'open-uri'
    require 'nokogiri'
    puts 'Starting database populate'
    data = Nokogiri::XML(open('http://data.tfl.gov.uk/tfl/syndication/feeds/stations-facilities.xml'))
    stations = data.xpath('//station')
    # station = stations.first
    stations.each do |station|
      name = station.xpath('./name').inner_html
      address = station.xpath('./contactDetails/address').inner_html
      rx = /[A-Z]{1,2}(?:\d[A-Z]|\d{1,2})\s\d[A-Z]{2}/
      postcode = address.match(rx)[0] if address.match(rx)
      zone = station.xpath('./zones/zone').inner_html
      coordinates = station.xpath('./Placemark/Point/coordinates').inner_html
      latitude, longitude = coordinates.split(',').map(&:to_f)
      puts name, address, zone, latitude, longitude, postcode
      Station.create({name: name, address: address, postcode: postcode, latitude: latitude, longitude: longitude}) unless Station.find_by_name(name)
    end
  end


end