require 'spec_helper'

RSpec.describe Suricate::Template do
  subject { Suricate::Template.new(template_path) }
  let(:template_path) { resource_path('templates/hello.txt') }

  describe '#render' do
    it 'renders template' do
      result = subject.render
      expect(result).to eq('Hello')
    end
  end
end
