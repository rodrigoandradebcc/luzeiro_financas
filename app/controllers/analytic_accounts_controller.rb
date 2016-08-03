class AnalyticAccountsController < ApplicationController
  before_action :set_analytic_account, only: [:show, :edit, :update, :destroy, :analytic_ledger]

  # GET /analytic_accounts
  # GET /analytic_accounts.json
  def index
    @analytic_accounts = AnalyticAccount.all
    

  end

  def analytic_ledger
    @operations = Operation.includes(:retrieve_account).where(retrieve_account:
                                                             @analytic_account)
    @operations += Operation.includes(:release_account).where(release_account: @analytic_account)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  

  end



  # GET /analytic_accounts/1
  # GET /analytic_accounts/1.json
  def show
    @operations = Operation.includes(:retrieve_account).where(retrieve_account:
                                                             @analytic_account)
    @operations += Operation.includes(:release_account).where(release_account: @analytic_account)
    
 
  end

  # GET /analytic_accounts/new
  def new
    @analytic_account = AnalyticAccount.new
  end

  # GET /analytic_accounts/1/edit
  def edit
  end

  # POST /analytic_accounts
  # POST /analytic_accounts.json
  def create
    @analytic_account = AnalyticAccount.new(analytic_account_params)

    respond_to do |format|
      if @analytic_account.save
        format.html { redirect_to @analytic_account, notice: 'Analytic account was successfully created.' }
        format.json { render :show, status: :created, location: @analytic_account }
      else
        format.html { render :new }
        format.json { render json: @analytic_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analytic_accounts/1
  # PATCH/PUT /analytic_accounts/1.json
  def update
    respond_to do |format|
      if @analytic_account.update(analytic_account_params)
        format.html { redirect_to @analytic_account, notice: 'Analytic account was successfully updated.' }
        format.json { render :show, status: :ok, location: @analytic_account }
      else
        format.html { render :edit }
        format.json { render json: @analytic_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analytic_accounts/1
  # DELETE /analytic_accounts/1.json
  def destroy
    @analytic_account.destroy
    respond_to do |format|
      format.html { redirect_to analytic_accounts_url, notice: 'Analytic account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analytic_account
      @analytic_account = AnalyticAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analytic_account_params
      params.require(:analytic_account).permit(:code, :name, :description, :balance, :synthetic_account_id)
    end

    
end
