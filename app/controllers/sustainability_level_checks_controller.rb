class SustainabilityLevelChecksController < ApplicationController

  def index
    @sustainability_level_checks = SustainabilityLevelCheck.all
  end

  def fetch_last_check
    render json: SustainabilityLevelCheck.last, status: :ok
  end

  def check
    sustainability_level_check = SustainabilityLevelCheck.new({edifice_id: 1})
    sustainability_level_check.level = pick_random_level
    sustainability_level_check.save
    render :partial => 'sustainability_level_check', locals: { sustainability_level_check: sustainability_level_check }
  end

  private
    def sustainability_level_check_params
      params.require(:sustainability_level_check).permit(:edifice_id)
    end

    def pick_random_level
      levels_size = SustainabilityLevelCheck.levels.size
      SustainabilityLevelCheck.levels.values[rand(0..levels_size - 1)]
    end
end
