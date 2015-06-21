require 'spec_helper'

RSpec.describe Suricate::WidgetsBuilder do
  subject { Suricate::WidgetsBuilder.new(template_repository) }
  let(:template_repository) { Suricate::TemplateRepository.new(resource_path('app/templates')) }

  describe '#counter' do
    it 'stores a counter widget' do
      subject.counter :errors, double('collector')

      counter = subject.widgets.first
      expect(counter).to be_a(Suricate::CounterWidget)
      expect(counter.id).to eq(:errors)
    end
  end
end
