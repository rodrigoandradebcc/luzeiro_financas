class SixthLevelsController < ApplicationController
  before_action :set_sixth_level, only: [:show, :edit, :update, :destroy]

  # GET /sixth_levels
  # GET /sixth_levels.json
  def index
    @sixth_levels = SixthLevel.all
  end

  # GET /sixth_levels/1
  # GET /sixth_levels/1.json
  def show
  end

  # GET /sixth_levels/new
  def new
    @sixth_level = SixthLevel.new
  end

  # GET /sixth_levels/1/edit
  def edit
  end

  # POST /sixth_levels
  # POST /sixth_levels.json
  def create
    @sixth_level = SixthLevel.new(sixth_level_params)

    respond_to do |format|
      if @sixth_level.save
        format.html { redirect_to @sixth_level, notice: 'Sixth level was successfully created.' }
        format.json { render :show, status: :created, location: @sixth_level }
      else
        format.html { render :new }
        format.json { render json: @sixth_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sixth_levels/1
  # PATCH/PUT /sixth_levels/1.json
  def update
    respond_to do |format|
      if @sixth_level.update(sixth_level_params)
        format.html { redirect_to @sixth_level, notice: 'Sixth level was successfully updated.' }
        format.json { render :show, status: :ok, location: @sixth_level }
      else
        format.html { render :edit }
        format.json { render json: @sixth_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sixth_levels/1
  # DELETE /sixth_levels/1.json
  def destroy
    @sixth_level.destroy
    respond_to do |format|
      format.html { redirect_to sixth_levels_url, notice: 'Sixth level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sixth_level
      @sixth_level = SixthLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sixth_level_params
      params.require(:sixth_level).permit(:code, :name, :analytic, :balance_id, :fifth_level_id)
    end
end
