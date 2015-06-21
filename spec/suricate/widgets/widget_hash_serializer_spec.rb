require 'spec_helper'

RSpec.describe Suricate::WidgetHashSerializer do
  subject { Suricate::WidgetHashSerializer.new(widget) }
  let(:widget) { Suricate::CounterWidget.new('errors', collector, name: 'Errors') }
  let(:collector) { double('collector') }

  describe '#encode' do
    it 'returns a hash with all widgets infos' do
      infos = subject.encode
      expect(infos).to eq({
        id: 'errors',
        type: 'CounterWidget',
        configuration: { name: 'Errors' }
      })
    end
  end
end
