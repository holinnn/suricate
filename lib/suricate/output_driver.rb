module Suricate
  class OutputDriver
    def render(content);    raise NotImplementedError; end
    def status(code);       raise NotImplementedError; end
    def content_type(type); raise NotImplementedError; end

    def api_success(data)
      api_response(200, data)
    end

    def api_error(status, message)
      data = { error: { message: message } }
      api_response(status, data)
    end

    def api_response(status, data)
      response = {
        status: status,
        data: data
      }
      json = JSON.generate(response)

      status(status)
      content_type(:json)
      render(json)
    end
  end
end
