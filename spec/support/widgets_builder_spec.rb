require 'spec_helper'

RSpec.describe Suricate::WidgetsBuilder do
  subject { Suricate::WidgetsBuilder.new(template_repository) }
  let(:template_repository) { double('template_repository') }
  let(:collector) { double('collector') }
  let(:template) { double('template', render: '') }

  class FakeWidget < Suricate::Widget; end

  describe '#register' do
    it 'adds widget with wanted template' do
      expect(template_repository).to receive(:find_widget).with('counter').and_return(template)
      subject.register(:fake, FakeWidget, collector, template: 'counter')

      widget = subject.widgets.first
      expect(widget.id).to eq(:fake)
      expect(widget).to be_a(FakeWidget)
    end

    it 'adds widget with template based on #id' do
      expect(template_repository).to receive(:find_widget).with('fake').and_return(template)
      subject.register(:fake, FakeWidget, collector)
    end

    it 'adds widget with default template' do
      expect(template_repository).to receive(:find_widget).with('fake').and_return(nil)
      expect(template_repository).to receive(:find_widget).with('counter').and_return(template)
      subject.register(:fake, FakeWidget, collector)
    end
  end
end
