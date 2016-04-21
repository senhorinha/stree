class SustainabilityLevelCheck < ActiveRecord::Base
  belongs_to :edifice
  enum level: {
    VERY_LOW: "Very Low",
    LOW: "Low",
    MEDIUM: "Medium",
    HIGH: "High",
    VERY_HIGH: "Very High"
  }
end
