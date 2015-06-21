require 'spec_helper'

RSpec.describe Suricate::TemplateRepository do
  subject { Suricate::TemplateRepository.new(templates_directory) }
  let(:templates_directory) { resource_path('templates') }

  describe '#find' do
    it 'raises an TemplateNotFound error if template not found' do
      expect {
        subject.find('fake_template')
      }.to raise_error(Suricate::TemplateRepository::TemplateNotFound)
    end

    it 'finds file with extension' do
      template = subject.find('hello.txt')
      expect(template).to be_a(Suricate::Template)
    end

    it 'finds file without extension' do
      template = subject.find('hello')
      expect(template).to be_a(Suricate::Template)
    end
  end

  describe '#find_page' do
    it 'searches in /pages' do
      template = subject.find_page('page1')
      expect(template).to be_a(Suricate::Template)
    end
  end

  describe '#find_widget' do
    it 'searches /widgets' do
      template = subject.find_widget('errors')
      expect(template).to be_a(Suricate::Template)
    end
  end
end
