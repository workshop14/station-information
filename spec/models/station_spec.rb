require 'spec_helper'

describe Station do
  it 'should create a valid station' do
    station = Station.new name: 'Wapping'
    expect(station).to be_valid
  end

  it 'should work with factory girl' do
    FactoryGirl.create(:station)
    station = Station.first
    expect(station.name).to eq('Wapping')
  end
end
