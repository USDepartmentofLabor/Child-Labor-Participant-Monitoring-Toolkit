class IndicatorDetail < ActiveRecord::Base
  belongs_to :indicator
  belongs_to :reporting_period

  def delta
    if target.nil? || actual.nil?
      return nil
    end

    d = target - actual

    if d < 0
      d = "(#{d})"
    end

    d.to_s
  end
end
