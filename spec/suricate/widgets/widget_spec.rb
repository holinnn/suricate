require 'spec_helper'

RSpec.describe Suricate::Widget do
  subject { Suricate::Widget.new(:errors, collector, configuration) }
  let(:collector) { double('collector') }
  let(:configuration) { double('configuration') }

  describe '#id' do
    it 'returns the id' do
      expect(subject.id).to eq(:errors)
    end
  end

  describe '#collector' do
    it 'returns the collector' do
      expect(subject.collector).to eq(collector)
    end
  end

  describe '#configuration' do
    it 'returns the configuration' do
      expect(subject.configuration).to eq(configuration)
    end
  end

  describe '#type' do
    it 'returns the widget type' do
      expect(subject.type).to eq('Widget')
    end
  end
end
