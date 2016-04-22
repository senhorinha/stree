require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new

scheduler.every '1m' do
  puts "Checking Sustainability Level..."
  levels_size = SustainabilityLevelCheck.levels.size
  level = SustainabilityLevelCheck.levels.values[rand(0..levels_size - 1)]
  SustainabilityLevelCheck.create({edifice_id: 1, level: level})
  puts "done."
end

scheduler.every '20m' do
  puts "Destroying Checks older than two minutes..."
  SustainabilityLevelCheck.where('created_at < ?', 20.minutes.ago).each do |check|
    check.destroy
  end
  puts "done."
end
