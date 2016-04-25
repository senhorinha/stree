require 'rufus/scheduler'
require 'sustainability_fuzzylogic_manager'
require 'fuzzy_logic_level_converter'
scheduler = Rufus::Scheduler.new

scheduler.every '1m' do
  puts "Checking Sustainability Level..."
  fuzzy_result = SustainabilityFuzzyLogicManager.read_random_line_of_csv
  sustainability_level = FuzzyLogicLevelConverter.convert_to_sustainability_level fuzzy_result
  SustainabilityLevelCheck.create({edifice_id: 1, level: sustainability_level})
  puts "done."
end

scheduler.every '20m' do
  puts "Destroying Checks older than two minutes..."
  SustainabilityLevelCheck.where('created_at < ?', 20.minutes.ago).each do |check|
    check.destroy
  end
  puts "done."
end
