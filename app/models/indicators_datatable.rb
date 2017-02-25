class IndicatorsDatatable
  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      data: data
    }
  end

private

  def data
    indicators.map do |i|
      [
        @view.send(:h, i.code),
        @view.send(:link_to, i.indicator, i),
        @view.send(:h, i.reporting_frequency.name),
        @view.send(:h, i.baseline),
        @view.send(:h, i.indicator_type)
      ]
    end
  end

  def indicators
    @indicators ||= fetch_indicators
  end

  def fetch_indicators
    Indicator.all
  end

end
