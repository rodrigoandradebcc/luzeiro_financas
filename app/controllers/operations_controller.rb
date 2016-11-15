class OperationsController < ApplicationController
  include OperationsHelper

  before_action :authenticate_user!
  before_action :set_operation, only: [:show, :edit, :update,  :destroy, :authorize_operation]

  # GET /operations
  # GET /operations.json
  def index
    @q = Operation.ransack(params[:q])

    @operations = @q.result.paginate(:page => params[:page], :per_page => 20  ).order('release_date desc')

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "relatório",

        :header => {
                  :html => {
                     :template => 'layouts/pdf-header.html',
                     :layout => 'pdf-header.html'

                  }
               },
               :footer => {
                  :html => {
                     :template => 'layouts/pdf-footer.html'
                  }
               }

    end
  end
  end

  # GET /operations/1
  # GET /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # # GET /operations/1/edit
  # def edit
  # end

  # POST /operations
  # POST /operations.json
  def create
    respond_to do |format|
      @operation = Operation.new(operation_params)

      if @operation.save
         format.html { redirect_to operations_path, notice: 'Operação criada com sucesso. Necessita ser autorizada.' }

      else
        format.html { render :new }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /operations/1
  # # PATCH/PUT /operations/1.json
  # def update

  #   respond_to do |format|
  #     if @operation.update(operation_params)
  #       redirect_to update_balance_path, method: :put; return if performed?
  #       format.html { redirect_to ledger_path, notice: 'Operation was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @operation }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @operation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    authorize @operation
    @operation.destroy
      respond_to do |format|
        format.html { redirect_to operations_url, notice: 'Operação removida, valores atualizados.' }
        format.json { head :no_content }
      end

  end

  # POST /operation
  def authorize_operation
      authorize @operation
      @operation.authorize

      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Operação Autorizada, valores atualizados com sucesso.' }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def operation_params
     params.require(:operation).permit(:value, :description, :release_date, :retrieve_account_id, :release_account_id)
  end








end
