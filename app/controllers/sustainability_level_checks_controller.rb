require 'sustainability_fuzzylogic_manager'
require 'fuzzy_logic_level_converter'

class SustainabilityLevelChecksController < ApplicationController

  def index
    @sustainability_level_checks = SustainabilityLevelCheck.order(created_at: "desc")
  end

  def fetch_last_check
    render json: SustainabilityLevelCheck.last, status: :ok
  end

  def check
    fuzzy_result = SustainabilityFuzzyLogicManager.read_random_line_of_csv
    sustainability_level = FuzzyLogicLevelConverter.convert_to_sustainability_level fuzzy_result
    render :partial => 'sustainability_level_check', locals: { sustainability_level_check: SustainabilityLevelCheck.create({edifice_id: 1, level: sustainability_level})}
  end

  private
  def sustainability_level_check_params
    params.require(:sustainability_level_check).permit(:edifice_id)
  end

end
