class IndicatorDetail < ActiveRecord::Base
  belongs_to :indicator
  belongs_to :reporting_period

  def delta
    if target.nil? || actual.nil?
      return nil
    end

    d = actual - target

    if d < 0
      d = "(#{d})"
    end

    d.to_s
  end
end
