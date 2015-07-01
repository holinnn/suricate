require 'spec_helper'

RSpec.describe Suricate::SinatraOutputDriver do
  subject { Suricate::SinatraOutputDriver.new(application) }
  let(:application) { double('application') }

  describe '#render' do
    it 'calls Sinatra#body' do
      expect(application).to receive(:body).with('')
      subject.render('')
    end
  end

  describe '#status' do
    it 'calls Sinatra#status' do
      expect(application).to receive(:status).with(200)
      subject.status(200)
    end
  end

  describe '#content_type' do
    it 'calls Sinatra#content_type' do
      expect(application).to receive(:content_type).with(:json)
      subject.content_type(:json)
    end
  end
end
