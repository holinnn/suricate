class FakeCounterCollector
  def initialize(value)
    @value = value
  end

  def populate(response, params)
    response.value(@value)
  end
end
