class SustainabilityLevelChecksController < ApplicationController

  def index
    @sustainability_level_checks = SustainabilityLevelCheck.order(created_at: "desc")
  end

  def fetch_last_check
    render json: SustainabilityLevelCheck.last, status: :ok
  end

  def check
    render :partial => 'sustainability_level_check', locals: { sustainability_level_check: SustainabilityLevelCheck.create({edifice_id: 1, level: pick_random_level})}
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
