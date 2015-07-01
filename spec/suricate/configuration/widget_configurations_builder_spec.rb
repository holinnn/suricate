require 'spec_helper'

RSpec.describe Suricate::WidgetConfigurationsBuilder do
  subject { Suricate::WidgetConfigurationsBuilder.new(template_repository) }
  let(:template_repository) { double('template_repository') }
  let(:collector) { double('collector') }
  let(:template) { double('template', render: '') }

  class GraphWidget < Suricate::Widget; end

  describe '#register' do
    it 'adds widget with wanted template' do
      expect(template_repository).to receive(:find_widget).with('counter').and_return(template)
      subject.register(:fake, GraphWidget, collector, template: 'counter', name: 'Errors')

      configuration = subject.configurations.first
      expect(configuration.id).to eq(:fake)
      expect(configuration.klass).to eq(GraphWidget)
      expect(configuration.collector).to eq(collector)
      expect(configuration.options).to eq(template: '', name: 'Errors')
      expect(configuration).to be_a(Suricate::WidgetConfiguration)
    end

    it 'adds widget with template based on #id' do
      expect(template_repository).to receive(:find_widget).with('fake').and_return(template)
      subject.register(:fake, GraphWidget, collector)
    end

    it 'adds widget with default template' do
      expect(template_repository).to receive(:find_widget).with('fake').and_return(nil)
      expect(template_repository).to receive(:find_widget).with('graph').and_return(template)
      subject.register(:fake, GraphWidget, collector)
    end
  end
end
