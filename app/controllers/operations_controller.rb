class OperationsController < ApplicationController
  include OperationsHelper
  before_action :set_operation, only: [:show, :edit, :update,  :destroy, :create_balance,
   :undo_last_operation]


  # GET /operations
  # GET /operations.json
  def index
     if params[:date_init] and params[:date_final]
      
      @operations = Operation.date_search(params[:date_init], params[:date_final]).order("id DESC")
    else
      @operations = Operation.all.order('created_at DESC')
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
          create_balance
         format.html { redirect_to root_path, notice: 'Operation was successfully created.' }
        
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
    undo_last_operation
    @operation.destroy
    respond_to do |format|
      format.html { redirect_to operations_url, notice: 'Operation was successfully destroyed.' }
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

  def create_balance
    
      retrieve_value = @operation.retrieve_account.balance + @operation.value 
      release_value = @operation.release_account.balance - @operation.value      
      @operation.release_account.update(balance: release_value)
      @operation.retrieve_account.update(balance: retrieve_value)
      retrieve_ob  = OldBalance.new(operation: @operation, analytic_account: @operation.retrieve_account, value:  retrieve_value)
      release_ob = OldBalance.new(operation: @operation, analytic_account: @operation.release_account, value: release_value)  
      retrieve_ob.save!
      release_ob.save!

  end
 

  def undo_last_operation
    retrieve_balance =  @operation.retrieve_account.balance - @operation.value
    release_balance = @operation.release_account.balance + @operation.value
    @operation.retrieve_account.update(balance: retrieve_balance)
    @operation.release_account.update(balance: release_balance)
  end

  

end
