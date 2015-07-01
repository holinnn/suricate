require 'spec_helper'

RSpec.describe Suricate::WidgetRepository do
  subject { Suricate::WidgetRepository.new(configurations) }
  let(:configurations) {[configuration]}
  let(:configuration) { Suricate::WidgetConfiguration.new(:errors, FakeWidget, collector, options) }
  let(:options) { { name: 'Errors count' } }
  let(:collector) { double('collector') }
  let(:context) { double('context') }


  describe '#instantiate' do
    it 'returns a widget' do
      widget = subject.instantiate(:errors, context)
      expect(widget.id).to eq(:errors)
      expect(widget).to be_a(FakeWidget)
    end

    it 'raises an exception if not found' do
      expect {
        subject.instantiate(:fake_widget, context)
      }.to raise_error(Suricate::WidgetRepository::WidgetNotFound)
    end
  end

  describe '#configurations' do
    it 'returns all widgets' do
      expect(subject.configurations).to eq(configurations)
    end
  end

end
