class SecondLevelsController < ApplicationController
  before_action :set_second_level, only: [:show, :edit, :update, :destroy]

  # GET /second_levels
  # GET /second_levels.json
  def index
    @second_levels = SecondLevel.all
  end

  # GET /second_levels/1
  # GET /second_levels/1.json
  def show
  end

  # GET /second_levels/new
  def new
    @second_level = SecondLevel.new
  end

  # GET /second_levels/1/edit
  def edit
  end

  # POST /second_levels
  # POST /second_levels.json
  def create
    @second_level = SecondLevel.new(second_level_params)

    respond_to do |format|
      if @second_level.save
        format.html { redirect_to @second_level, notice: 'Second level was successfully created.' }
        format.json { render :show, status: :created, location: @second_level }
      else
        format.html { render :new }
        format.json { render json: @second_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /second_levels/1
  # PATCH/PUT /second_levels/1.json
  def update
    respond_to do |format|
      if @second_level.update(second_level_params)
        format.html { redirect_to @second_level, notice: 'Second level was successfully updated.' }
        format.json { render :show, status: :ok, location: @second_level }
      else
        format.html { render :edit }
        format.json { render json: @second_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /second_levels/1
  # DELETE /second_levels/1.json
  def destroy
    @second_level.destroy
    respond_to do |format|
      format.html { redirect_to second_levels_url, notice: 'Second level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_second_level
      @second_level = SecondLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def second_level_params
      params.require(:second_level).permit(:code, :name, :balance_id)
    end
end
