require 'spec_helper'

RSpec.describe Suricate::ChartSerieBuilder do
  class TestChartSerieBuild < Suricate::ChartSerieBuilder
    def _name; @name; end
    def _values; @values; end
  end

  subject { TestChartSerieBuild.new }

  describe '#name' do
    it 'sets name' do
      subject.name('earnings')
      expect(subject._name).to eq('earnings')
    end
  end

  describe '#values' do
    it 'adds some values' do
      subject.values([1, 2])
      expect(subject._values).to eq([1, 2])
    end
  end

  describe '#value' do
    it 'add one value' do
      subject.value(4)
      expect(subject._values).to eq([4])
    end
  end

  describe '#serie' do
    it 'returns a ChartSerie' do
      subject.name('earnings')
      subject.values([1, 2, 3])
      subject.color('#ff00ff')
      serie = subject.serie
      expect(serie).to be_a(Suricate::ChartSerie)
      expect(serie.name).to eq('earnings')
      expect(serie.values).to eq([1, 2, 3])
      expect(serie.color).to eq('#ff00ff')
    end
  end
end
