require 'spec_helper'

RSpec.describe Suricate::WidgetRepository do
  subject { Suricate::WidgetRepository.new(widgets) }
  let(:widgets) { [widget] }
  let(:widget) { double('widget', id: :errors) }

  describe '#find' do
    it 'returns the widget' do
      widget_found = subject.find(:errors)
      expect(widget_found).to eq(widget)
    end

    it 'raises an exception if not found' do
      expect {
        subject.find(:fake_widget)
      }.to raise_error(Suricate::WidgetRepository::WidgetNotFound)
    end
  end

  describe '#all' do
    it 'returns all widgets' do
      expect(subject.all).to eq(widgets)
    end
  end

end
