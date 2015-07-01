require 'spec_helper'

RSpec.describe Suricate::WidgetConfiguration do
  subject { Suricate::WidgetConfiguration.new(:errors, FakeWidget, collector, options) }
  let(:options) { { name: 'Errors count' } }
  let(:collector) { double('collector') }

  class FakeWidget < Suricate::Widget; end

  describe '#instantiate' do
    it 'creates a widget' do
      context = double('context')
      widget = subject.instantiate(context)
      expect(widget).to be_a(FakeWidget)
      expect(widget.id).to eq(:errors)
      expect(widget.collector).to eq(collector)
      expect(widget.options).to eq(options)
    end
  end

  describe '#to_h' do
    it 'returns a hash' do
      expect(subject.to_h).to eq({
        id: :errors,
        type: 'FakeWidget',
        configuration: {
          name: 'Errors count'
        }
      })
    end
  end
end
