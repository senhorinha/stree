require 'csv'
require 'pry'

class SustainabilityFuzzyLogicManager

  EXTERNAL_TEMPERATURE_CSV_INDEX = 0
  INTERNAL_TEMPERATURE_CSV_INDEX = 1
  AIR_CONDITIONING_CONSUMPTION_CSV_INDEX = 2

  def self.read_random_line_of_csv
    prepare_inputs
    rows = CSV.read('app/resources/input.csv')
    max_index = rows.size - 1
    row = rows[rand(0..max_index)]
    @external_temperature.value = row[EXTERNAL_TEMPERATURE_CSV_INDEX].to_i
    @internal_temperature.value = row[INTERNAL_TEMPERATURE_CSV_INDEX].to_i
    @air_conditioning_consumption.value = row[AIR_CONDITIONING_CONSUMPTION_CSV_INDEX].to_i
    @result = SustainabilityFuzzyLogic.resolve(@external_temperature, @internal_temperature, @air_conditioning_consumption)
  end

  def self.read_csv
    prepare_inputs
    CSV.foreach('app/resources/input.csv') do |row|
      @external_temperature.value = row[EXTERNAL_TEMPERATURE_CSV_INDEX].to_i
      @internal_temperature.value = row[INTERNAL_TEMPERATURE_CSV_INDEX].to_i
      @air_conditioning_consumption.value = row[AIR_CONDITIONING_CONSUMPTION_CSV_INDEX].to_i
      @result = SustainabilityFuzzyLogic.resolve(@external_temperature, @internal_temperature, @air_conditioning_consumption)
      print_result
    end
  end

  private
  def self.prepare_inputs
    prepare_external_temperature
    prepare_internal_temperature
    prepare_air_conditioning_consumption
  end

  def self.prepare_external_temperature
    low_interval = create_interval(15, 23)
    med_interval = create_interval(24, 27)
    high_interval = create_interval(28, 35)
    @external_temperature = FuzzyInput.new(low_interval, med_interval, high_interval)
  end

  def self.prepare_internal_temperature
    low_interval = create_interval(15, 23)
    med_interval = create_interval(24, 27)
    high_interval = create_interval(28, 35)
    @internal_temperature = FuzzyInput.new(low_interval, med_interval, high_interval)
  end

  def self.prepare_air_conditioning_consumption
    low_interval = create_interval(0, 666)
    med_interval = create_interval(667, 1333)
    high_interval = create_interval(1334, 2000)
    @air_conditioning_consumption = FuzzyInput.new(low_interval, med_interval, high_interval)
  end

  def self.create_interval minimum, maximum
    {minimum: minimum, maximum: maximum}
  end

  def print_result
    puts "------------\n"
    puts "Resultado para os valores: \ntemp_externa #{@external_temperature.value}\ntemp_interna #{@internal_temperature.value}\nar_cond #{@air_conditioning_consumption.value}"
    puts "Resultado: #{@result}"
  end

end
