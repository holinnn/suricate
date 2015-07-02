require 'spec_helper'

RSpec.describe Suricate::ChartBuilder do
  class TestChartBuilder < Suricate::ChartBuilder
    def _labels
      @labels
    end
  end

  subject { TestChartBuilder.new }

  describe '#serie' do
    it 'yields a Suricate::SerieBuilder' do
      serie = nil
      subject.serie { |s| serie = s }

      expect(serie).to be_a(Suricate::ChartSerieBuilder)
    end
  end

  describe '#labels' do
    it 'stores labels' do
      subject.labels(%(jan feb))
      expect(subject._labels).to eq(%(jan feb))
    end
  end

  describe '#chart' do
    it 'returns a chart' do
      chart = subject.chart
      expect(chart).to be_a(Suricate::Chart)
    end
  end
end
