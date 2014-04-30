require 'spec_helper'

describe Station do
  it 'should create a valid station' do
    station = Station.new name: 'Wapping'
    expect(station).to be_valid
  end
end
