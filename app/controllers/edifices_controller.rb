class EdificesController < ApplicationController
  before_action :set_edifice, only: [:show, :edit, :update, :destroy]

  # GET /edifices
  # GET /edifices.json
  def index
    @edifices = Edifice.all
  end

  # GET /edifices/1
  # GET /edifices/1.json
  def show
  end

  # GET /edifices/new
  def new
    @edifice = Edifice.new
  end

  # GET /edifices/1/edit
  def edit
  end

  # POST /edifices
  # POST /edifices.json
  def create
    @edifice = Edifice.new(edifice_params)

    respond_to do |format|
      if @edifice.save
        format.html { redirect_to @edifice, notice: 'Edifice was successfully created.' }
        format.json { render :show, status: :created, location: @edifice }
      else
        format.html { render :new }
        format.json { render json: @edifice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edifices/1
  # PATCH/PUT /edifices/1.json
  def update
    respond_to do |format|
      if @edifice.update(edifice_params)
        format.html { redirect_to @edifice, notice: 'Edifice was successfully updated.' }
        format.json { render :show, status: :ok, location: @edifice }
      else
        format.html { render :edit }
        format.json { render json: @edifice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edifices/1
  # DELETE /edifices/1.json
  def destroy
    @edifice.destroy
    respond_to do |format|
      format.html { redirect_to edifices_url, notice: 'Edifice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edifice
      @edifice = Edifice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edifice_params
      params.require(:edifice).permit(:name, :sustainability_level, :last_update_of_sustainability_level)
    end
end
