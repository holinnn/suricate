require 'spec_helper'
require 'rack/test'
require 'json'

RSpec.describe Suricate::Application do
  include Rack::Test::Methods
  let(:app) { Suricate::Application.new(configuration) }
  let(:configuration) do
    Suricate.build do |config|
      config.templates_directory = resource_path('app/templates')
      config.default_page        = 'page1'

      config.widgets do |widgets|
        widgets.counter :errors, double('collector'), name: 'Errors count'
      end
    end
  end


  describe '/' do
    it 'renders the default tempalte' do
      get('/')
      body = last_response.body
      expect(body).to eq('Page1')
    end
  end

  describe '/:page' do
    it 'renders a template' do
      get('/page2')
      body = last_response.body
      expect(body).to eq('Page2')
    end
  end

  describe '/api/widgets' do
    it 'returns all widgets configurations' do
      get('/api/widgets')
      json = JSON.parse(last_response.body)
      expect(json).to eq({
        'status' => 200,
        'data' => {
          'widgets' => [
            {
              'id' => 'errors',
              'type' => 'CounterWidget',
              'configuration' => {
                'name' => 'Errors count',
                'template' => 'Errors'
              }
            }
          ]
        }
      })
    end
  end

end
