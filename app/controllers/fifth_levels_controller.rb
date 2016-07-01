class FifthLevelsController < ApplicationController
  before_action :set_fifth_level, only: [:show, :edit, :update, :destroy]

  # GET /fifth_levels
  # GET /fifth_levels.json
  def index
    @fifth_levels = FifthLevel.all
  end

  # GET /fifth_levels/1
  # GET /fifth_levels/1.json
  def show
  end

  # GET /fifth_levels/new
  def new
    @fifth_level = FifthLevel.new
    @balance = @fifth_level.build_balance

  end

  # GET /fifth_levels/1/edit
  def edit
  end

  # POST /fifth_levels
  # POST /fifth_levels.json
  def create
    @fifth_level = FifthLevel.new(fifth_level_params)

    respond_to do |format|
      if @fifth_level.save
        format.html { redirect_to @fifth_level, notice: 'Fifth level was successfully created.' }
        format.json { render :show, status: :created, location: @fifth_level }
      else
        format.html { render :new }
        format.json { render json: @fifth_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fifth_levels/1
  # PATCH/PUT /fifth_levels/1.json
  def update
    respond_to do |format|
      if @fifth_level.update(fifth_level_params)
        format.html { redirect_to @fifth_level, notice: 'Fifth level was successfully updated.' }
        format.json { render :show, status: :ok, location: @fifth_level }
      else
        format.html { render :edit }
        format.json { render json: @fifth_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fifth_levels/1
  # DELETE /fifth_levels/1.json
  def destroy
    @fifth_level.destroy
    respond_to do |format|
      format.html { redirect_to fifth_levels_url, notice: 'Fifth level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fifth_level
      @fifth_level = FifthLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fifth_level_params
      params.require(:fifth_level).permit(:code, :name, :analytic, :balance_id, :fourth_level_id)
    end
end
