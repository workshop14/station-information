class Station < ActiveRecord::Base
  I18n.enforce_available_locales = true
  validates_presence_of :name
end
