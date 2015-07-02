require 'spec_helper'

RSpec.describe Suricate::Refinements::String do
  using Suricate::Refinements::String

  describe '#camelize' do
    it 'capitalize first letter' do
      expect('test'.camelize).to eq('Test')
    end

    it 'replaces underscores with capital letter' do
      expect('test_camelize'.camelize).to eq('TestCamelize')
    end
  end

  describe '#constantize' do
    it 'creates a constant from string' do
      expect('Suricate'.constantize).to eq(Suricate)
    end

    it 'creates nested constants' do
      expect('Suricate::Widget'.constantize).to eq(Suricate::Widget)
    end
  end
end
