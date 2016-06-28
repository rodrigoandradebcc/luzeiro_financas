class SeventhLevelsController < ApplicationController
  before_action :set_seventh_level, only: [:show, :edit, :update, :destroy]

  # GET /seventh_levels
  # GET /seventh_levels.json
  def index
    @seventh_levels = SeventhLevel.all
  end

  # GET /seventh_levels/1
  # GET /seventh_levels/1.json
  def show
  end

  # GET /seventh_levels/new
  def new
    @seventh_level = SeventhLevel.new
  end

  # GET /seventh_levels/1/edit
  def edit
  end

  # POST /seventh_levels
  # POST /seventh_levels.json
  def create
    @seventh_level = SeventhLevel.new(seventh_level_params)

    respond_to do |format|
      if @seventh_level.save
        format.html { redirect_to @seventh_level, notice: 'Seventh level was successfully created.' }
        format.json { render :show, status: :created, location: @seventh_level }
      else
        format.html { render :new }
        format.json { render json: @seventh_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seventh_levels/1
  # PATCH/PUT /seventh_levels/1.json
  def update
    respond_to do |format|
      if @seventh_level.update(seventh_level_params)
        format.html { redirect_to @seventh_level, notice: 'Seventh level was successfully updated.' }
        format.json { render :show, status: :ok, location: @seventh_level }
      else
        format.html { render :edit }
        format.json { render json: @seventh_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seventh_levels/1
  # DELETE /seventh_levels/1.json
  def destroy
    @seventh_level.destroy
    respond_to do |format|
      format.html { redirect_to seventh_levels_url, notice: 'Seventh level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seventh_level
      @seventh_level = SeventhLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seventh_level_params
      params.require(:seventh_level).permit(:code, :name, :analytic, :balance_id, :sixth_level_id)
    end
end
