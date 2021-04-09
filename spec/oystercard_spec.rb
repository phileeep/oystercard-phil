require 'oystercard'


describe Oystercard do 

let (:min_fare) { Oystercard::MIN_FARE }
let (:station){ double :station }
let (:entry_station){ double :station }
let (:exit_station){ double :station }

  context '#initialize' do
    it { is_expected.to respond_to(:balance) }

    it 'has a default value' do
      expect(subject.balance).to eq(0)
    end

     it 'has a maximum balance' do
       expect(Oystercard::MAX_BALANCE).to eq 90
    end

    it 'raises an error when max reached' do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "The maximum balance of #{maximum_balance} has been reached"
    end
  end

  context '#topup' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'Can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

  context '#touch_in' do 
    it { is_expected.to respond_to(:touch_in)}

    it 'Raises an error if balance is less than £1' do
      expect{ subject.touch_in(station) }.to raise_error("Insufficient funds, your balance is less than #{min_fare}")
    end
  end

  context '#touch_out' do
    it { is_expected.to respond_to(:touch_out)}
  end

  context '#journey history' do
    it 'By default returns an empty array' do
      expect(subject.journey_history).to eq []
    end

    it 'returns entire journey history when touched out' do
      subject.top_up(min_fare)
      subject.touch_in(station)
      subject.touch_out(exit_station)
      expect(subject.journey_history).to eq([{"Entry station"=>station, "Exit station" => exit_station}])
    end
  end
end