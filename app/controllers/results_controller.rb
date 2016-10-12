
class ResultsController < ApplicationController
 
  before_action :set_result, only: [ :show, :edit, :update, :destroy]
  before_action :set_debit_accounts, :set_credit_accounts, only: [:new]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
        @init_date = @result.init.strftime("%d/%m/%Y")
        @final_date = @result.final.strftime("%d/%m/%Y") 
        
        @credit_accounts = @result.analytic_accounts.includes(:credits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
        where(account_types: {code: [3]}).where(operations: {release_date: @result.init..@result.final}).
        where.not(second_synthetic_accounts: {code: [2]})
        
       
        @debit_accounts = @result.analytic_accounts.includes(:debits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
        where(account_types: {code: [4,5]}).
        where(operations: {release_date: @result.init..@result.final})
        @credit_value = @credit_accounts.sum(:balance).abs
      @debit_value = @debit_accounts.sum(:balance).abs

  end

  def selecionar_periodo
    if params[:date_init] and params[:date_final]
      
     redirect_to action: :check_valid_date, params: params

    end
      
    
  end

  def check_valid_date
    unless params[:date_init].empty? and params[:date_final].empty?
       @init_date = Date.strptime(params[:date_init], "%d/%m/%Y") 
       @final_date = Date.strptime(params[:date_final], "%d/%m/%Y")

    end
  
  if @init_date && @final_date && @init_date < @final_date
    redirect_to action: :new, params: params
  else
    redirect_to :back, alert: "Por favor, insira uma data válida."
  end
end
  

  # GET /results/new
  def new
      @init_date = Date.strptime(params[:date_init], "%d/%m/%Y")
      @final_date = Date.strptime(params[:date_final], "%d/%m/%Y") 

      @result = Result.new(init: params[:date_init], final: params[:date_final])

      @credit_value = @credit_accounts.sum(:balance).abs
      @debit_value = @debit_accounts.sum(:balance).abs
      @balance = @credit_value.abs  -  @debit_value.abs
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

      respond_to do |format|
        if  @result.save
          
          format.html { redirect_to @result, notice: 'Result was successfully created.' }
          format.json { render :show, status: :created, location: @result }
        else
          format.html { render :new }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    # end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:name, :description, :analytic_account_id, :kind, :balance, :init, :final)
      
    end
     def set_credit_accounts
        init =params[:date_init]
        final =params[:date_final]
        @credit_accounts = AnalyticAccount.result_accounts init, final, "C"
    end

    def set_debit_accounts
         init =params[:date_init]
         final =params[:date_final]
         @debit_accounts = AnalyticAccount.result_accounts  init, final, "D"
    end

    def set_result_accounts
         init =params[:date_init]
         final =params[:date_final]
         @result_accounts = AnalyticAccount.result_accounts  init, final, "BOTH"      
    end


end
