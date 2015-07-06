require 'spec_helper'
require 'json'

RSpec.describe Suricate::CounterWidget do
  subject { Suricate::CounterWidget.new(id: :counter, collector: collector, context: context) }
  let(:collector) { FakeCounterCollector.new(500) }
  let(:context) { double('context', output: output, params: {}) }
  let(:output) { OutputDriverRecorder.new }

  describe '#execute' do
    it 'outputs data for counter' do
      subject.execute
      json = JSON.generate({
        'status' => 200,
        'data' => {
          'status' => 'ok',
          'value' => 500
        }
      })
      expect(output._content).to eq(json)
    end
  end
end
