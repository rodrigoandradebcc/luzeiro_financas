class FirstLevelsController < ApplicationController
  before_action :set_first_level, only: [:show, :edit, :update, :destroy]

  # GET /first_levels
  # GET /first_levels.json
  def index
    @first_levels = FirstLevel.all
  end

  # GET /first_levels/1
  # GET /first_levels/1.json
  def show
  end

  # GET /first_levels/new
  def new
    @first_level = FirstLevel.new
  end

  # GET /first_levels/1/edit
  def edit
  end

  # POST /first_levels
  # POST /first_levels.json
  def create
    @first_level = FirstLevel.new(first_level_params)

    respond_to do |format|
      if @first_level.save
        format.html { redirect_to @first_level, notice: 'First level was successfully created.' }
        format.json { render :show, status: :created, location: @first_level }
      else
        format.html { render :new }
        format.json { render json: @first_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_levels/1
  # PATCH/PUT /first_levels/1.json
  def update
    respond_to do |format|
      if @first_level.update(first_level_params)
        format.html { redirect_to @first_level, notice: 'First level was successfully updated.' }
        format.json { render :show, status: :ok, location: @first_level }
      else
        format.html { render :edit }
        format.json { render json: @first_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_levels/1
  # DELETE /first_levels/1.json
  def destroy
    @first_level.destroy
    respond_to do |format|
      format.html { redirect_to first_levels_url, notice: 'First level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_level
      @first_level = FirstLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def first_level_params
      params.require(:first_level).permit(:code, :name, :description, :chart_of_account_id, :balance_id)
    end
end
