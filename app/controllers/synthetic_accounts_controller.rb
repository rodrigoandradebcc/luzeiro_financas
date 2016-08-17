class SyntheticAccountsController < ApplicationController
  before_action :set_synthetic_account, only: [:show, :edit, :update, :destroy]

  # GET /synthetic_accounts
  # GET /synthetic_accounts.json
  def index
    @synthetic_accounts = SyntheticAccount.all
  end

  # GET /synthetic_accounts/1
  # GET /synthetic_accounts/1.json
  def show
  end

  # GET /synthetic_accounts/new
  def new
    @synthetic_account = SyntheticAccount.new
  end

  # GET /synthetic_accounts/1/edit
  def edit
  end

  # POST /synthetic_accounts
  # POST /synthetic_accounts.json
  def create
    @synthetic_account = SyntheticAccount.new(synthetic_account_params)

    respond_to do |format|
      if @synthetic_account.save
        format.html { redirect_to new_second_synthetic_account_path, notice: 'Conta criada com sucesso.' }
        
      else
        format.html { render :new }
        format.json { render json: @synthetic_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /synthetic_accounts/1
  # PATCH/PUT /synthetic_accounts/1.json
  def update
    respond_to do |format|
      if @synthetic_account.update(synthetic_account_params)
        format.html { redirect_to @synthetic_account, notice: 'Synthetic account was successfully updated.' }
        format.json { render :show, status: :ok, location: @synthetic_account }
      else
        format.html { render :edit }
        format.json { render json: @synthetic_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synthetic_accounts/1
  # DELETE /synthetic_accounts/1.json
  def destroy
    @synthetic_account.destroy
    respond_to do |format|
      format.html { redirect_to synthetic_accounts_url, notice: 'Synthetic account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synthetic_account
      @synthetic_account = SyntheticAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def synthetic_account_params
      params.require(:synthetic_account).permit(:code, :name, :description, :balance, :account_id)
    end
end
