class FakeStatusCollector
  def initialize(status)
    @status = status
  end

  def populate(response, options = {})
    case @status
    when :ok
      response.ok!
    when :alert
      response.alert!
    when :warning
      response.warning!
    end
  end
end
