
class ResultsController < ApplicationController
 
  before_action :set_result, only: [ :show, :edit, :update, :destroy]
  
  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
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
     @result = Result.new
     session[:init_date] = @init_date = Date.strptime(params[:date_init], "%d/%m/%Y") 
     session[:final_date] =  @final_date = Date.strptime(params[:date_final], "%d/%m/%Y")
      
      @credit_accounts = AnalyticAccount.
      includes(:credits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
        where(account_types: {code: [3]}).where(operations: {release_date: @init_date..@final_date}).
        where.not(second_synthetic_accounts: {code: [2]})
        

      @debit_accounts = AnalyticAccount.
        includes(:debits, second_synthetic_account: {synthetic_account: {account: :account_type}}).
        where(account_types: {code: [4,5]}).
        where(operations: {release_date: @init_date..@final_date})

    
      @credit_value = 0
      @debit_value = 0
      @credit_accounts.each{|c|@credit_value+=c.balance}
      @debit_accounts.each{|d|@debit_value+=d.balance}
      session[:balance]= @balance =  - @credit_value - @debit_value
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)
    @init_date = session[:init_date].to_date.strftime("%d/%m/%Y")
    @final_date = session[:final_date].to_date.strftime("%d/%m/%Y")
    unless set_result_accounts.nil?
      @result.analytic_accounts = set_result_accounts
      @result.name = "#{@init_date} à #{@final_date}"
      @result.balance = session[:balance]
      
      
      respond_to do |format|
        if @result.save
          session.delete(:balance)
          session.delete(:init_date)
          session.delete(:final_date)
          format.html { redirect_to @result, notice: 'Result was successfully created.' }
          format.json { render :show, status: :created, location: @result }
        else
          format.html { render :new }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    end
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
      params.require(:result).permit(:name, :description, :analytic_account_id, :kind, :balance, :date_init,:date_final)
      
    end

    def set_result_accounts
           init =session[:init_date]
          final =session[:final_date]
         AnalyticAccount.result_accounts init, final
    end

   
    
    
    

    # def set_result_operations
    #        init =session[:init_date]
    #       final =session[:final_date]
    #      AnalyticAccount.result_accounts init, final
    # end

    

    
end
