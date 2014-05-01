require 'spec_helper'

FactoryGirl.define do
  factory :station do
    name 'Wapping'
    address 'Wapping Station, London Underground Ltd., Wapping High St, London, E1 9NQ'
    postcode 'E1 9NQ'
    longitude(-0.055846250896647850)
    latitude 51.504268283481814000
  end
end

describe Station do
  context 'Required details' do
    [:name, :address, :postcode, :longitude, :latitude].each do |attribute|
      it "should invalid without a #{attribute}" do
        station = build(:station, Hash[attribute, nil])
        expect(station).not_to be_valid
        expect(station.errors[attribute]).not_to be_empty
      end
    end
    ['EEE', 'ABC 123', 'AB1 EEE'].each do |postcode|
      it "should evaluate postcode #{postcode} to be invalid" do
        station = build(:station, postcode: postcode)
        expect(station).not_to be_valid
      end
    end
    context 'stations with the same name' do
      let(:station) { create(:station) }
      subject{ build(:station, name: station.name) }
      it{ should be_invalid }
    end
  end
end
