require 'spec_helper'

RSpec.describe Suricate::Chart do
  subject { Suricate::Chart.new(labels, series) }
  let(:labels) { %w(jan feb) }
  let(:series) { [serie] }
  let(:serie) { Suricate::ChartSerie.new('earnings', [1, 2, 3]) }

  describe 'to_h' do
    it 'returns a Hash' do
      expect(subject.to_h).to eq({
        labels: labels,
        series: [
          name: 'earnings',
          values: [1, 2, 3]
        ]
      })
    end
  end
end
