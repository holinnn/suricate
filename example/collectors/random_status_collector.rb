class RandomStatusCollector
  def initialize
    @statuses = %i(ok warning alert)
  end

  def populate(response, options = {})
    status = @statuses.sample
    case status
    when :ok
      response.ok!
    when :alert
      response.alert!
    when :warning
      response.warning!
    end
  end
end
