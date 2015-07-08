require 'spec_helper'

RSpec.describe Suricate::StatusWidget do
  subject { Suricate::StatusWidget.new(id: :counter, collector: collector, context: context) }
  let(:collector) { FakeStatusCollector.new(:ok) }
  let(:context) { double('context', output: output, params: {}) }
  let(:output) { OutputDriverRecorder.new }

  describe '#execute' do
    it 'outputs data for counter' do
      subject.execute
      json = JSON.generate({
        'status' => 200,
        'data' => {
          'status' => 'ok'
        }
      })
      expect(output._content).to eq(json)
    end
  end
end
