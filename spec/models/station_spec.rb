require 'spec_helper'

FactoryGirl.define do
  factory :station do
    name 'Wapping'
    address 'Wapping Station, London Underground Ltd., Wapping High St, London, E1 9NQ'
    postcode 'E1 9NQ'
    longitude -0.055846250896647850
    latitude 51.504268283481814000
  end
end

describe Station do
  context 'Required details' do
    subject(:station) { build(:station) }
    its(:name) { should eq('Wapping') }
  end
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

  describe 'special' do
    subject(:station) { create(:station) }
    its(:name) { should == 'Wapping' }
    it 'should be valid' do
      expect(subject).to be_valid
    end
    it 'should be valid' do
      expect(station).to be_valid
    end
    it { should be_valid }
  end
end
