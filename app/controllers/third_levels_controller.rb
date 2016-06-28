class ThirdLevelsController < ApplicationController
  before_action :set_third_level, only: [:show, :edit, :update, :destroy]

  # GET /third_levels
  # GET /third_levels.json
  def index
    @third_levels = ThirdLevel.all
  end

  # GET /third_levels/1
  # GET /third_levels/1.json
  def show
  end

  # GET /third_levels/new
  def new
    @third_level = ThirdLevel.new
  end

  # GET /third_levels/1/edit
  def edit
  end

  # POST /third_levels
  # POST /third_levels.json
  def create
    @third_level = ThirdLevel.new(third_level_params)

    respond_to do |format|
      if @third_level.save
        format.html { redirect_to @third_level, notice: 'Third level was successfully created.' }
        format.json { render :show, status: :created, location: @third_level }
      else
        format.html { render :new }
        format.json { render json: @third_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /third_levels/1
  # PATCH/PUT /third_levels/1.json
  def update
    respond_to do |format|
      if @third_level.update(third_level_params)
        format.html { redirect_to @third_level, notice: 'Third level was successfully updated.' }
        format.json { render :show, status: :ok, location: @third_level }
      else
        format.html { render :edit }
        format.json { render json: @third_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /third_levels/1
  # DELETE /third_levels/1.json
  def destroy
    @third_level.destroy
    respond_to do |format|
      format.html { redirect_to third_levels_url, notice: 'Third level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third_level
      @third_level = ThirdLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def third_level_params
      params.require(:third_level).permit(:code, :name, :second_level_id)
    end
end
