require 'journey'

describe Journey do

let (:entry_station) { double :station }
let (:exit_station) { double :station }
let (:subject) { Journey.new }

# before do 
#   subject.start(entry_station)
# end

  context("#journey") do
      it 'Knows the station that it started from' do
        subject.start(entry_station)
        expect(subject.entry_station).to eq(entry_station)
      end

      it 'Can end a journey' do 
        subject.end(exit_station)
        expect(subject.exit_station).to eq(exit_station)
      end

      it 'Returns the penalty fare if the journey is not complete' do
        subject.start(entry_station)
        expect(subject.fare).to eq(Journey::PENALTY_FARE)
      end

      it "Returns the penalty fare if the user didn't touch in" do 
        subject.end(exit_station)
        expect(subject.fare).to eq(Journey::PENALTY_FARE)
      end

      it "Returns the penalty fare if the user didn't touch out" do
        subject.start(entry_station)
        expect(subject.fare).to eq(Journey::PENALTY_FARE)
      end

      it "Returns the default fare of #{Journey::BASE_FARE} for a complete journey" do
        subject.start(entry_station)
        subject.end(exit_station)
        expect(subject.fare).to eq(Journey::BASE_FARE)
      end

      it 'Knows if a journey is complete or not' do
        subject.start(entry_station)
        expect(subject.incomplete_journey).to eq(true)
      end
  end
end
