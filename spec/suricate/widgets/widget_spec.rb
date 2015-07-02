require 'spec_helper'

RSpec.describe Suricate::Widget do
  subject { Suricate::Widget.new(id: :errors, collector: collector, options: options) }
  let(:collector) { double('collector') }
  let(:options) { {} }

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

  describe '#options' do
    it 'returns the options' do
      expect(subject.options).to eq(options)
    end
  end

  describe '#type' do
    it 'returns the widget type' do
      expect(subject.type).to eq('Widget')
    end
  end

  describe '::type' do
    it 'returns the widget type' do
      expect(subject.class.type).to eq('Widget')
    end
  end
end
