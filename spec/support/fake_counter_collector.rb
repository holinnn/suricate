class FakeCounterCollector
  def initialize(value)
    @value = value
  end

  def count
    @value
  end
end