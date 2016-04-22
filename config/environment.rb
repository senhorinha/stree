# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
Time::DATE_FORMATS[:sustainability_level_check] = "%b, %m %Y - %I:%M%p"
