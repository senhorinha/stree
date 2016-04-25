class FuzzyInput

  attr_reader :high_interval, :medium_interval, :low_interval
  attr_accessor :value

  def initialize  low_interval, medium_interval, high_interval
    @low_interval = low_interval
    @medium_interval = medium_interval
    @high_interval = high_interval
  end

  def high?
    @value.between?(@high_interval[:minimum], @high_interval[:maximum])
  end

  def medium?
    @value.between?(@medium_interval[:minimum], @medium_interval[:maximum])
  end

  def low?
    @value.between?(@low_interval[:minimum], @low_interval[:maximum])
  end
end
