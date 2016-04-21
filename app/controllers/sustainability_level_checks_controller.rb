class SustainabilityLevelChecksController < ApplicationController

  def index
    @sustainability_level_checks = SustainabilityLevelCheck.all
  end

  # POST /sustainability_level_checks
  # POST /sustainability_level_checks.json
  def create
    @sustainability_level_check = SustainabilityLevelCheck.new(sustainability_level_check_params)
    SustainabilityLevelCheck.level = pick_random_level

    respond_to do |format|
      if @sustainability_level_check.save
        render :partial => 'sustainability_level_check', locals: { sustainability_level_check: @sustainability_level_check }
        format.html { redirect_to @sustainability_level_check, notice: 'Sustainability level check was successfully created.' }
        format.json { render :show, status: :created, location: @sustainability_level_check }
      else
        format.json { render json: @sustainability_level_check.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def sustainability_level_check_params
      params.require(:sustainability_level_check).permit(:edifice_id)
    end

    def pick_random_level
      levels_size = SustainabilityLevelCheck.levels.size
      SustainabilityLevelCheck.levels.values[rand(0..levels_size)]
    end
end
