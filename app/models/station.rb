class Station < ActiveRecord::Base
  I18n.enforce_available_locales = true
  validates_presence_of :name, :address, :postcode, :longitude, :latitude
  validates_format_of :postcode, with: /\A[A-Z]{1,2}(?:\d[A-Z]|\d{1,2})\s\d[A-Z]{2}\Z/
end
