require 'spec_helper.rb'

RSpec.describe Suricate::DelegationCallback do
  subject { Suricate::DelegationCallback.new(:success) }

  describe '::new' do
    it 'registers callbacks' do
      expect {
        subject.success {}
      }.to_not raise_error
    end
  end

  describe '#call' do
    it 'executes callback' do
      success = false
      subject.success { success = true }
      subject.call(:success)

      expect(success).to be_truthy
    end
  end
end
