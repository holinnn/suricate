require 'spec_helper'

RSpec.describe Suricate::CounterWidget do
  subject { Suricate::CounterWidget.new(:id, collector, configuration) }
  let(:collector) { FakeCounterCollector.new(200) }

  describe '#process' do
    
  end

end
