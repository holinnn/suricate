require 'spec_helper'

RSpec.describe Suricate::ConfigurationBuilder do
  describe '#configuration' do
    it 'builds a configuration' do
      configuration = subject.configuration
      expect(configuration).to be_a(Suricate::Configuration)
    end
  end

  describe '#widgets' do
    it 'yields a widget builder' do
      builder = nil
      subject.widgets { |widgets| builder = widgets }
      expect(builder).to be_a(Suricate::WidgetsBuilder)
    end
  end

  describe '#public_directory=' do
    it 'sets public directory' do
      subject.public_directory = '/tmp'
      config = subject.configuration
      expect(config.public_directory).to eq('/tmp')
    end
  end

  describe '#templates_directory' do
    it 'sets templates directory' do
      subject.templates_directory = '/tmp'
      repository = subject.configuration.template_repository
      expect(repository.path).to eq('/tmp')
    end
  end
end
