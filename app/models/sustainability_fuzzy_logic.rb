class SustainabilityFuzzyLogic

  HIGH = {minimum: 0.66, maximum: 1}
  MEDIUM = {minimum: 0.33, maximum: 0.65}
  LOW = {minimum: 0, maximum: 0.32}
  IMPOSSIBLE = {minimum: -1, maximum: -1}

  def self.resolve external_temperature, internal_temperature, air_conditioning_consumption
    @external_temperature = external_temperature
    @internal_temperature = internal_temperature
    @air_conditioning_consumption = air_conditioning_consumption
    rule_1? || rule_2? || rule_3? || rule_4? || IMPOSSIBLE
  end

  private
  def self.rule_1?
    external_and_internal_are_high = @external_temperature.high? && @internal_temperature.high?
    external_high_and_internal_medium = @external_temperature.high? && @internal_temperature.medium?
    external_low_internal_low = @external_temperature.low? && @internal_temperature.low?

    if(external_and_internal_are_high || external_high_and_internal_medium || external_low_internal_low)
      if @air_conditioning_consumption.high?
        LOW
      elsif @air_conditioning_consumption.medium?
        MEDIUM
      else
        HIGH
      end
    end
  end

  def self.rule_2?
    if(@external_temperature.medium? && @internal_temperature.medium?)
      if @air_conditioning_consumption.high?
        LOW
      elsif @air_conditioning_consumption.medium?
        MEDIUM
      else @air_conditioning_consumption.low?
        HIGH
      end
    end
  end

  def self.rule_3?
    if(@external_temperature.high? && @internal_temperature.low?)
      (@air_conditioning_consumption.high?) ? MEDIUM : HIGH
    end
  end

  def self.rule_4?
    if(((@external_temperature.medium? || @external_temperature.low?) && @internal_temperature.high?) || @external_temperature.low? && @internal_temperature.medium?)
      LOW
    end
  end

end
