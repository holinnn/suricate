require 'spec_helper'

RSpec.describe Suricate::CounterWidgetResponse do
  describe '#value' do
    it 'raises an error if value is not a number' do
      expect {
        subject.value('not a number')
      }.to raise_error(Suricate::CounterWidgetResponse::NotAnNumberError)
    end

    describe '#to_h' do
      it 'returns a Hash' do
        subject.value(12)
        expect(subject.to_h).to eq({
          value: 12
        })
      end
    end
  end
end
