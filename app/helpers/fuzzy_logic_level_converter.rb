class FuzzyLogicLevelConverter

  def self.convert_to_sustainability_level fuzzy_level_result
    return SustainabilityLevelCheck.levels["HIGH"] if fuzzy_level_result == SustainabilityFuzzyLogic::HIGH
    return SustainabilityLevelCheck.levels["MEDIUM"] if fuzzy_level_result == SustainabilityFuzzyLogic::MEDIUM
    return SustainabilityLevelCheck.levels["LOW"] if fuzzy_level_result == SustainabilityFuzzyLogic::LOW
  end

end
