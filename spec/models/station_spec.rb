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

  it 'should work with factory girl name overwrite' do
    FactoryGirl.create(:station, name: 'Kennington')
    station = Station.first
    expect(station.name).to eq('Kennington')
    expect(Station.all.length).to eq(1)
  end

  it 'should be possible to remove FactoryGirl namespace' do
    bank = build(:station, name: 'bank')
    expect(Station.all.length).to eq(0)
    expect(bank).to be_valid
    expect(bank.save).to be_true
    expect(Station.all.length).to eq(1)
  end
end
