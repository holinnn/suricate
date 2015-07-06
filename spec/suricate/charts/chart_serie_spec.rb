require 'spec_helper'

RSpec.describe Suricate::ChartSerie do
  subject { Suricate::ChartSerie.new('earnings', [1, 2, 3], '#ffffff') }
  describe '#to_h' do
    it 'returns a Hash' do
      expect(subject.to_h).to eq({
        name: 'earnings',
        values: [1, 2, 3],
        color: '#ffffff'
      })
    end
  end
end
