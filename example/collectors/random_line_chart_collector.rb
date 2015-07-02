class RandomLineChartCollector
  def populate(response, params)
    response.chart do |chart|
      chart.labels %w(jan feb mar apr may jun jul sep oct nov dec)

      2.times { |index| create_serie(chart, index) }
    end
  end

  private
  def create_serie(chart, index)
    chart.serie do |serie|
      serie.name "Serie #{index}"
      12.times { serie.value(rand(10000 * index)) }
    end
  end
end
