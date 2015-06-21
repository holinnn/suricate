require 'spec_helper'

RSpec.describe Suricate::WidgetConfiguration do
  subject { Suricate::WidgetConfiguration.new(attributes) }
  let(:attributes) { { name: 'Errors count' } }

  describe '#to_h' do
    it 'returns a hash with all attributes' do
      expect(subject.to_h).to eq(attributes)
    end
  end
end
