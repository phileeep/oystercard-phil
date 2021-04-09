require 'station'

describe Station do 

  subject {described_class.new(name: "Kings Cross", zone: 1)}
  it 'knows the name of the station' do 
    expect(subject.name).to eq("Kings Cross")
  end
  it 'knows the zone of the station' do
    expect(subject.zone).to eq 1
  end
end