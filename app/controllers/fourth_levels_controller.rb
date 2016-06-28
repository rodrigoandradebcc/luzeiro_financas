class FourthLevelsController < ApplicationController
  before_action :set_fourth_level, only: [:show, :edit, :update, :destroy]

  # GET /fourth_levels
  # GET /fourth_levels.json
  def index
    @fourth_levels = FourthLevel.all
  end

  # GET /fourth_levels/1
  # GET /fourth_levels/1.json
  def show
  end

  # GET /fourth_levels/new
  def new
    @fourth_level = FourthLevel.new
  end

  # GET /fourth_levels/1/edit
  def edit
  end

  # POST /fourth_levels
  # POST /fourth_levels.json
  def create
    @fourth_level = FourthLevel.new(fourth_level_params)

    respond_to do |format|
      if @fourth_level.save
        format.html { redirect_to @fourth_level, notice: 'Fourth level was successfully created.' }
        format.json { render :show, status: :created, location: @fourth_level }
      else
        format.html { render :new }
        format.json { render json: @fourth_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fourth_levels/1
  # PATCH/PUT /fourth_levels/1.json
  def update
    respond_to do |format|
      if @fourth_level.update(fourth_level_params)
        format.html { redirect_to @fourth_level, notice: 'Fourth level was successfully updated.' }
        format.json { render :show, status: :ok, location: @fourth_level }
      else
        format.html { render :edit }
        format.json { render json: @fourth_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fourth_levels/1
  # DELETE /fourth_levels/1.json
  def destroy
    @fourth_level.destroy
    respond_to do |format|
      format.html { redirect_to fourth_levels_url, notice: 'Fourth level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fourth_level
      @fourth_level = FourthLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fourth_level_params
      params.require(:fourth_level).permit(:code, :name, :analytic, :balance_id, :third_level_id)
    end
end
