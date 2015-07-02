class OutputDriverRecorder < Suricate::OutputDriver
  attr_reader :_content, :_status, :content_type

  def render(content)
    @_content = content
  end

  def status(code)
    @_status = code
  end

  def content_type(type)
    @_content_type = type
  end
end
