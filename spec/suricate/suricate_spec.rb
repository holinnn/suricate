require 'spec_helper'

RSpec.describe Suricate do
  describe '::build' do
    it 'yields a builder' do
      builder = nil
      Suricate.build { |config| builder = config }
      expect(builder).to be_a(Suricate::ConfigurationBuilder)
    end

    it 'returns a configuration' do
      configuration = Suricate.build { }
      expect(configuration).to be_a(Suricate::Configuration)
    end
  end
end
