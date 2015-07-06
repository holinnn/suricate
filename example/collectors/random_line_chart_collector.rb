class RandomLineChartCollector
  def initialize
    @colors = %w(#CC3637 #286B7B)
  end

  def populate(response, params)
    response.chart do |chart|
      chart.labels %w(jan feb mar apr may jun jul sep oct nov dec)

      2.times { |index| create_serie(chart, index) }
    end
  end

  private
  def create_serie(chart, index)
    chart.serie do |serie|
      serie.name "Serie #{index + 1}"
      serie.color @colors[index]
      12.times { serie.value(rand(10000 * (index + 1))) }
    end
  end
end
