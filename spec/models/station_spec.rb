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
    it 'should be invalid without a name' do
      station = build(:station, name: nil)
      expect(station).not_to be_valid
      expect(station.errors[:name]).not_to be_empty
    end
  end

end
