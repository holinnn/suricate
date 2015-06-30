require 'spec_helper'
require 'rack/test'
require 'json'

RSpec.describe Suricate::Application do
  include Rack::Test::Methods
  let(:app) { Suricate::Application.new(configuration) }
  let(:collector) { FakeCounterCollector.new(20) }
  let(:configuration) do
    Suricate.build do |config|
      config.templates_directory = resource_path('app/templates')
      config.default_page        = 'page1'

      config.widgets do |widgets|
        widgets.counter :errors, collector, name: 'Errors count'
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

  describe '/api/widgets/:id' do
    it 'passes the request to the widget' do
      pending
      get('/api/widgets/errors')

      json = JSON.parse(last_response.body)
      expect(json).to eq({
        'status' => 200,
        'data' => {
          'value' => 20
        }
      })
    end

    it 'sends a 404 status if widget is not found' do
      get('/api/widgets/fake')
      expect(last_response.status).to eq(404)
      json = JSON.parse(last_response.body)
      expect(json).to eq({
        'status' => 404,
        'data' => {
          'error' => {
            'message' => 'widget with id=fake not found'
          }
        }
      })
    end
  end

end
