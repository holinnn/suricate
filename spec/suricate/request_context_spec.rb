require 'spec_helper'

RSpec.describe Suricate::RequestContext do
  subject { Suricate::RequestContext.new(request: request, session: session, output: output) }
  let(:output) { double('output') }
  let(:session) { double('session') }
  let(:request) { double('request', params: {}) }


  describe '#request' do
    it 'returns request' do
      expect(subject.request).to eq(request)
    end
  end

  describe '#params' do
    it 'returns params' do
      expect(subject.params).to eq(request.params)
    end
  end

  describe '#output' do
    it 'returns output' do
      expect(subject.output).to eq(output)
    end
  end

  describe '#session' do
    it 'returns session' do
      expect(subject.session).to eq(session)
    end
  end
end
