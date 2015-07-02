class RandomCounterCollector
  def populate(response, params)
    response.value(rand(10000))
  end
end
