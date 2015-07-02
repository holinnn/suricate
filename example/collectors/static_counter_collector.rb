class StaticCounterCollector
  def initialize(value)
    @value = value
  end

  def populate(output, params)
    output.value(@value)
  end
end
