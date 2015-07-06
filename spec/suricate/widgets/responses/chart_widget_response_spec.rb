require 'spec_helper'

RSpec.describe Suricate::ChartWidgetResponse do
  describe '#chart' do
    it 'yields a chart builder' do
      chart = nil
      subject.chart { |c| chart = c }

      expect(chart).to be_a(Suricate::ChartBuilder)
    end
  end

  describe '#to_h' do
    it 'returns a Hash' do
      subject.chart do |chart|
        chart.labels %w(jan feb)
        chart.serie do |serie|
          serie.name 'earnings'
          serie.value 12
          serie.color '#ffffff'
        end
      end
      expect(subject.to_h).to eq({
        chart: {
          labels: %w(jan feb),
          series: [{
            name: 'earnings',
            values: [12],
            color: '#ffffff'
          }]
        }
      })
    end
  end
end
